#!/usr/bin/env bash

# Exit codes:
#   0  -> Success
#   1  -> Usage error (invalid command)
#   2  -> Missing arguments
#   3  -> No notes found
#   4  -> Search yielded no results

# Sets the notes file location to the users home dir. So you can use this script in any dir
NOTES_FILE="$HOME/notes.txt"

# Just the help page to understand script usage
usage() {
  echo "Usage: $0 <command> [arguments]"
  echo "Commands:"
  echo "  add \"Your note text\"  - Add a new note with timestamp"
  echo "  list                   - List all notes"
  echo "  search \"keyword\"      - Search for notes containing a keyword"
  exit 1
}

# If the number of arguments is less than 1 meaning no arguments run usage
if [ $# -lt 1 ]; then
  usage
fi

# Case or elif, if the first argument = add, list or search do as they state
case "$1" in
  add)
    # Ensure a note text is provided
    if [ $# -lt 2 ]; then
      echo "Error: The 'add' command requires a note text argument."
      exit 2
    fi

    # Shift away the 'add' argument, remaining arguments are the note text
    shift
    note_text="$*"

    # date and time function
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    # Append the new note with a timestamp
    echo "$timestamp - $note_text" >> "$NOTES_FILE"
    echo "Note added successfully."
    exit 0
    ;;
  
  list)
    # Check if notes file exists and is not empty
    if [ ! -f "$NOTES_FILE" ] || [ ! -s "$NOTES_FILE" ]; then
      echo "No notes found."
      exit 3
    fi

    # Display all notes
    cat "$NOTES_FILE"
    exit 0
    ;;
  
  search)
    # Ensure a search keyword is provided
    if [ $# -lt 2 ]; then
      echo "Error: The 'search' command requires a keyword."
      exit 2
    fi

    shift
    keyword="$*"

    # Check if notes file exists and is not empty
    if [ ! -f "$NOTES_FILE" ] || [ ! -s "$NOTES_FILE" ]; then
      echo "No notes found."
      exit 3
    fi

    # Perform case-insensitive search
    grep -i "$keyword" "$NOTES_FILE" || {
      echo "No matching notes found."
      exit 4
    }
    exit 0
    ;;
  
  *)
    # Invalid command
    usage
    ;;
esac
