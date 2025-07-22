import sys

import nate
import rui

args = sys.argv[1:] # Get arguments excluding the script name

if not args:
    # No arguments provided
    rui.update(False)
    nate.sync_files()
    nate.sync_remote()
    exit(0)

command = args[0]

if command == "rui":
    if len(args) == 1:
        rui.update(False)
        exit(0)

    subcommand = args[1]
    rui_args = args[2:] # Remaining arguments for rui subcommands

    if subcommand == "list":
        category_name = None
        show_categories = False
        i = 0
        while i < len(rui_args):
            if rui_args[i] == "-c":
                if i + 1 < len(rui_args):
                    category_name = rui_args[i+1]
                    i += 1 # Skip next arg as it's the category name
                else:
                    print("Error: -c requires a category_name.")
                    exit(0)
            elif rui_args[i] == "--categories":
                show_categories = True
            i += 1
        if category_name:
            rui.list_category(category_name)
        elif show_categories:
            rui.list_categories()
        else:
            rui.list_entries()

    elif subcommand == "add":
        aur = False
        category_name = None
        pkg_names = []
        i = 0
        while i < len(rui_args):
            if rui_args[i] == "--aur":
                aur = True
            elif rui_args[i] == "-c":
                if i + 1 < len(rui_args):
                    category_name = rui_args[i+1]
                    i += 1 # Skip next arg
                else:
                    print("Error: -c requires a category_name.")
                    exit(0)
            else:
                # Assume remaining arguments are package names
                pkg_names.append(rui_args[i])
            i += 1

        if not pkg_names:
            print("Error: 'rui add' requires at least one pkg_name.")
            exit(0)
        rui_add(pkg_names, aur, category_name)

    elif subcommand == "remove":
        if not rui_args:
            print("Error: 'rui remove' requires pkg_name.")
            exit(0)
        pkg_name = rui_args[0]
        rui_remove(pkg_name)

    elif subcommand == "query":
        aur = False
        pkg_name = None
        i = 0
        while i < len(rui_args):
            if rui_args[i] == "--aur":
                aur = True
            else:
                pkg_name = rui_args[i]
            i += 1

        if not pkg_name:
            print("Error: 'rui query' requires pkg_name.")
            exit(0)
        rui_query(pkg_name, aur)

    elif subcommand == "vim":
        rui_vim()

    else:
        print(f"Error: Unknown 'rui' subcommand '{subcommand}'")

elif command == "nate":
    if len(args) == 1:
        print("Error: 'nate' requires a subcommand (sync, remote, or vim).")
        exit(0)

    subcommand = args[1]

    if subcommand == "sync":
        nate_sync()
    elif subcommand == "remote":
        nate_remote()
    elif subcommand == "vim":
        nate_vim()
    else:
        print(f"Error: Unknown 'nate' subcommand '{subcommand}'")

else:
    print(f"Error: Unknown command '{command}'")
