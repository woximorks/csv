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

Run the following command to create the PostgreSQL database:

```bash
rails db:create db:migrate
```

### Directory Structure

- `lib/scripts`: Contains utility scripts for data processing.
  - `parse_excel.rb`: Script for parsing Excel files.
- `lib/data`: Contains data files used by the application.
  - data.xlsx contains some starter information and should be considred the template file.

### Running the Script

To run the Excel parsing script, use the following command:

```bash
ruby lib/scripts/parse_excel.rb
```

- scripts/parse_excel.rb
  - Make sure to modify line 5 of this file to specify the correct file name and path of your data.
  - Adjust the offset on line 17 if a header exists. 0 = header 0 rows tall, 1 = header 1 row tall, etc
  - Additionally, change the `::` in line 22 if the data uses a different separator.

## Changelog

All notable changes to this project will be documented in the [CHANGELOG.md](CHANGELOG.md) file.