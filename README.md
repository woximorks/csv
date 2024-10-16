# CSV Project

This is a useful tool to parse CSV files and convert the data to JSON format. It's initialized to also separate data within the existing field when '::' exists, much like a path structure. It checks for and removes duplicates on that path level, organizing the contents into nested objects when duplicates exist.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Changelog](#changelog)
- [Contributing](#contributing)
- [License](#license)

## Installation

To get started with this project, clone the repository and install the necessary gems:

```bash
git clone git@github.com:woximorks/csv.git
cd csv
bundle install
```

## Usage

Run the following command to create a new Rails application with PostgreSQL:

```bash
rails new csv -d postgresql
```

### Directory Structure

- `lib/scripts`: Contains utility scripts for data processing.
  - `parse_excel.rb`: Script for parsing Excel files.
- `lib/data`: Contains data files used by the application.

### Running the Script

To run the Excel parsing script, use the following command:

```bash
ruby lib/scripts/parse_excel.rb
```

Make sure to modify line 5 to specify the correct file and adjust the offset on line 17 if a header exists. Additionally, change the `::` in line 22 if the data uses a different separator.

## Changelog

All notable changes to this project will be documented in the [CHANGELOG.md](CHANGELOG.md) file.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
