# rsa_id_number Change Log

All notable changes to this project will be documented in this file. All changes/updates/entries are not 'breaking changes' unless otherwise mentioned.
This project adheres to [Semantic Versioning](https://semver.org/).

## 1.1.1 - 2026-04-29

- add FVM-first Makefile workflow with automatic setup
- add publish command (`make publish`)
- refresh README development instructions and update Dart SDK constraint

## 1.1.0 - 2026-04-29

- replace third-party `luhn_algorithm` dependency with an internal Luhn implementation
- reduce supply-chain risk by removing external checksum package dependency

## 0.0.1 - 2024-01-07

- initial draft

## 0.0.2 - 2024-01-07

- publish with updated  description & metadata

## 0.1.5 - 2024-01-08

- fix linter errors and update analysis rules

## 0.1.6 - 2024-01-08

- update the readme file

## 0.1.7 - 2024-01-09

- 'intl': always use the latest version

## 0.1.8 - 2024-01-11

- implement pub.dev recommendations, [see more](https://github.com/makhosi6/rsa_id_number/pull/9)

## 1.0.0 - 2024-06-01

### Added
- last and final module to parse id(string) to object
- the package is feature complete, it has all intended functionality(create, validate and parse rsa IDs)

## 1.0.1 - 2024-06-01

- update the docs

## 1.0.2 - 2024-06-01

- code coverage
- remove unused and and un-tested code

## 1.0.4 - 2025-11-23

- upgrade dependencies to latest major versions
- ensure compatibility with latest flutter version ([v3.38.0](https://docs.flutter.dev/release/release-notes/release-notes-3.38.0))
