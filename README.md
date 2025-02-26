# DirectoryWatcher

## Description
DirectoryWatcher is a command-line program written in C that monitors a specified directory for changes. It detects and logs events such as file creation, deletion, and modifications. All detected changes are recorded in a text file along with the filename, type of change, and a timestamp.

## Features
- Monitors a directory for changes in real-time.
- Detects file creation, deletion, and modifications.
- Logs all changes with timestamps to a text file in JSON format.
- Lightweight and efficient.

## Installation
### Prerequisites
- Linux operating system (currently supports Linux only).
- `inotify` must be installed for monitoring file system events.

### Steps to Install
1. Clone the repository or download the source code:
   ```sh
   git clone https://github.com/yourusername/DirectoryWatcher.git
   cd DirectoryWatcher
   ```
2. Compile the program using GCC:
   ```sh
   gcc -o directory_watcher directory_watcher.c -Wall
   ```
3. Ensure `inotify-tools` is installed on your system (if not already installed):
   ```sh
   sudo apt-get install inotify-tools  # For Debian-based distros
   sudo yum install inotify-tools      # For RHEL-based distros
   ```

## Usage
### Running the Program
1. Navigate to the project directory:
   ```sh
   cd DirectoryWatcher
   ```
2. Make the script executable:
   ```sh
   chmod +x directoryWatcher.sh
   ```
3. Run the script with the directory to monitor:
   ```sh
   ./directoryWatcher.sh /path/to/directory
   ```

### Example Output
When a file is created, deleted, or modified, the program logs entries in `log.txt` in JSON format like:
```
{"timestamp":"2024-11-23 18:58:32", "event":"CREATE", "file/directory": "/home/user/Testing/file1.txt"}
{"timestamp":"2024-11-23 18:58:41", "event":"DELETE", "file/directory": "/home/user/Testing/file1.txt"}
```

## Configuration
- The log file (`log.txt`) is created in the same directory as the program by default.
- Future updates may include support for filtering certain file types.

## Supported Platforms
- **Linux only** (due to dependency on `inotify`).

## Author
Developed by: Vandan Patel 
Contact: vandan04patel@gmail.com
GitHub: [https://github.com/yourusername](https://github.com/yourusername)

