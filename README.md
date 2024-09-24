# cpdirmk

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

`cpdirmk` is a powerful command-line tool that generates a Markdown representation of directory structures, including the content of text files. It's perfect for documentation, project overviews, and sharing folder structures in a readable format.

## Features

- 📁 Generates a Markdown representation of directory structures
- 📄 Includes content of text files in the output
- 🌳 Supports customizable depth limitation for directory traversal
- 🚫 Allows ignoring specific files or directories
- 🔍 Intelligently identifies and handles various file types
- 🎨 Produces clean and formatted Markdown output

## Table of Contents

- [cpdirmk](#cpdirmk)
  - [Features](#features)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Options](#options)
  - [Examples](#examples)
  - [File Type Handling](#file-type-handling)
  - [Contributing](#contributing)
  - [License](#license)
  - [Author](#author)
  - [Acknowledgments](#acknowledgments)

## Installation

1. Clone this repository:
   ```
   git clone https://github.com/your-username/cpdirmk.git
   ```

2. Navigate to the project directory:
   ```
   cd cpdirmk
   ```

3. Run the installation script with root privileges:
   ```
   sudo ./install.sh
   ```

   The script will install `cpdirmk` and its man page, making it available system-wide.

## Usage

Basic syntax:

```
cpdirmk [OPTIONS] DIRECTORY
```

## Options

- `-h, --help`: Display the help message and exit
- `-v, --version`: Show the program version and exit
- `-o, --output=FILE`: Specify the output file (default: output.md)
- `-d, --depth=NUMBER`: Set the maximum depth for directory traversal
- `-i, --ignore=PATTERN`: Ignore files/directories matching the specified pattern

## Examples

1. Generate a Markdown representation of the current directory:
   ```
   cpdirmk .
   ```

2. Create a structure of a specific directory with a custom output file:
   ```
   cpdirmk -o project_structure.md /path/to/your/project
   ```

3. Limit the depth and ignore certain files/directories:
   ```
   cpdirmk -d 3 -i '*.tmp' -i 'node_modules' -o limited_structure.md /path/to/project
   ```

## File Type Handling

`cpdirmk` intelligently handles various file types:

- **Text Files**: Content is included in the Markdown output.
- **Binary Files**: Marked as binary without content display.
- **Special Files**: Identified and handled appropriately (e.g., executables, symlinks).
- **Large Files**: Size is displayed instead of content for files exceeding a certain threshold.

## Contributing

We welcome contributions to `cpdirmk`! Here's how you can help:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with clear, descriptive messages.
4. Push your changes to your fork.
5. Submit a pull request with a clear description of your changes.

Please ensure your code adheres to the existing style and passes all tests.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Author

Eric Coleta - ericbercol@gmail.com

## Acknowledgments

- Thanks to all contributors who have helped shape `cpdirmk`.
- Inspired by the need for easy-to-share directory structures in Markdown format.

---

For more detailed information, please refer to the man page by running `man cpdirmk` after installation.