# Command-Line Note-Taking

A Bash-based command-line tool for managing notes. This tool allows you to quickly **add**, **list**, and **search** notes directly from your terminal.

----------

## Table of Contents

-   [Description](#description)
-   [Features](#features)
-   [Installation](#installation)
-   [Usage](#usage)
-   [Examples](#examples)
-   [Prerequisites](#prerequisites)
-   [Exit Codes](#exit-codes)
-   [FAQ](#faq)
-   [Bugs](#bugs)

----------

## Description

This Bash script provides a lightweight solution for maintaining notes without relying on third-party applications. Notes are stored with timestamps in a simple text file located in the user's home directory.

----------

## Features

-   **Add Notes**: Append a note with a timestamp to your notes file.
-   **List Notes**: Display all saved notes.
-   **Search Notes**: Find specific notes by keyword.
-   **Portable**: Works in any directory as it stores notes in your home directory.
-   **Minimal Dependencies**: Requires only a Bash shell.

----------

## Installation

1.  **Clone the Repository**
    
    ```bash
    git clone https://github.com/WTCSC/note-to-shelf-TAWN05.git
    
    ```
    
2.  **Save the Script**: Copy the script to a file named `note.sh` and place it in a directory of your choice.
    
3.  **Make the Script Executable**:
    
    ```bash
    chmod +x note.sh
    
    ```
    
4.  **(Optional) Add to PATH**: Move the script to a directory in your `PATH` (e.g., `/usr/local/bin`) so it can be accessed globally:
    
    ```bash
    mv note.sh /usr/local/bin
    
    ```
    

----------

## Usage

Run the script using the following syntax:

```bash
note.sh <command> [arguments]

```

### Commands

1.  **Add a Note**:
    
    ```bash
    note.sh add "Your note text"
    
    ```
    
    -   Saves a note with the current date and time.
2.  **List All Notes**:
    
    ```bash
    note.sh list
    
    ```
    
    -   Displays all notes stored in the `notes.txt` file.
3.  **Search Notes by Keyword**:
    
    ```bash
    note.sh search "keyword"
    
    ```
    
    -   Performs a case-insensitive search for notes containing the keyword.

----------

## Examples

1.  **Adding Notes**:
    
    ```bash
    note.sh add "Buy groceries"
    note.sh add "Finish the project by Friday"
    
    ```
    
2.  **Listing Notes**:
    
    ```bash
    note.sh list
    
    ```
    
3.  **Searching Notes**:
    
    ```bash
    note.sh search "groceries"
    
    ```
    
4.  **Error Handling**:
    
    -   If you forget to provide a note:
        
        ```bash
        note.sh add
        # Output: Error: The 'add' command requires a note text argument.
        
        ```
        

----------

## Prerequisites

-   **Operating System**: Unix-based (Linux, macOS, or Windows Subsystem for Linux).
-   **Bash Shell**: Version 4.0 or higher.
-   **Tools/Commands**: `grep`, `date`, `cat`.

----------

## Exit Codes

The script uses specific exit codes to indicate the outcome of its execution:

`0`

Success

`1`

Usage error (invalid command)

`2`

Missing arguments

`3`

No notes found

`4`

Search yielded no results

----------

## FAQ

### **Q: Where are the notes stored?**

The notes are stored in a text file named `notes.txt` located in your home directory (`~/notes.txt`).

### **Q: Can I use this script on Windows?**

This script works on Windows if you're using a Unix-like environment such as Windows Subsystem for Linux (WSL).

### **Q: How do I clear all my notes?**

Simply delete the `notes.txt` file:

```bash
rm ~/notes.txt

```

### **Q: What happens if I try to list notes without adding any?**

The script will inform you that no notes are found.

## Bugs

### **Injection**
this script does not have any input sanitation for additional arguments if quotation marks are not used than a secondary or more commands can be run. for example.

```bash
notes.sh add this is a test && ls -a
```
this will execute the ls -a command it is very highly recommended to use quotation marks so this problem will not occur. this is correct usage

```bash
notes.sh add "this is a test && ls -a"
```
this will add the note "this is a test && ls -a" and will not run the command.
