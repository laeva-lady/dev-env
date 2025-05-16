#!/usr/bin/env python3

from typing import Self
from sys import argv as args

# User-defined variables
DAY: int = 6500
'day temperature'
NIGHT: int = 3000
'night temperature'
DAWN: tuple[float, float] = (4, 6)
'time interval where night turns to day'
DUSK: tuple[float, float] = (19, 21)
'time interval where day turns to night'

class Slope:
    def __init__(self: Self,
        hr_start: float, hr_end: float,
        temp_start: int, temp_end: int,
    ) -> None:
        hr_end += 24 if hr_end < hr_start else 0
        self.hr_start: float = hr_start
        self.hr_end: float = hr_end

        duration = hr_end - hr_start
        if duration == 0:
            self.m: float = 0
            self.b: int = temp_end
        else:
            self.m: float = (temp_end - temp_start) / duration
            self.b: int = temp_start

    def at(self: Self, x: float) -> int:
        x += 24 if x < self.hr_start else 0
        x = min(self.hr_end, x) - self.hr_start
        return round(self.m * x + self.b)

dawn = Slope(DAWN[0], DAWN[1], NIGHT, DAY)
dusk = Slope(DUSK[0], DUSK[1], DAY, NIGHT)

def get_temp(hr: float) -> int:
    if dawn.hr_start < dusk.hr_start:
        return dawn.at(hr) if dawn.hr_start <= hr < dusk.hr_start else dusk.at(hr)
    else:
        return dusk.at(hr) if dusk.hr_start <= hr < dawn.hr_start else dawn.at(hr)

if len(args) > 1: # Specify number of intervals per hour to test gradients
    div = float(args[1])
    for i in range(int(24 * div)):
        h = i / div
        ih = int(h)
        print(f'{ih:02}:{int((h - ih) * 60):02} - {get_temp(h)}')
else:
    import subprocess, json
    from datetime import datetime

    identity = 6500
    now = datetime.now()
    temp = get_temp(now.hour + (now.minute / 60) + (now.second / (60 * 60)))
    cmd: list[str] = ['hyprctl', 'hyprsunset']
    cmd += ['identity'] if temp == identity else ['temperature', str(temp)]
    subprocess.run(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)
    class_name = (
        'candle' if temp < 2100 else
        'warm' if temp < 3800 else
        'neutral' if temp < 5500 else
        'cool'
    )
    print(json.dumps({
        'text': f'{temp}',
        'class': class_name,
        'tooltip': f'Color temperature: {temp}K ({class_name})'
    }))
