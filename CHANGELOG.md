# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] 2024/10/15

### Added
- n/a

### Changed
- Readme updated to reflect accurate application title

## Removed
- n/a

### Fixed
- n/a

## Security 
- n/a

## [1.0.0]

### Added
- Initial Rails setup
    - Command: `rails new csv -d postgresql`
    - `gem 'roo'`
    - `gem 'json'`
- Directory structure:
    - `mkdir -p lib/scripts` (Where associated 'do this with that' functions exist)
        - `parse_excel.rb`
        - Command: `ruby lib/scripts/parse_excel.rb`
        - Change line 5 to specify the file utilized.
        - Change the offset on line 17 if a header exists.
        - Change `::` in line 22 if the data uses a different separator.
- Directory structure:
    - `mkdir -p lib/data` (Where associated data for 'do that with' resides)

### Changed
- 

### Fixed
- n/a