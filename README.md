# Chocolatey Packages

Package Update Report: https://gist.github.com/automateazure/a10db4d96e25cd048cd1ed1ec2a086f4

This repository contains [chocolatey automatic packages](https://docs.chocolatey.org/en-us/create/automatic-packages).
The repository is setup so that packages are managed entirely from the GitHub web interface using the local repository copy.

## Chocolatey Packages Template

This contains Chocolatey packages, both manually and automatically maintained.

### Folder Structure

* automatic - where automatic packaging and packages are kept. These are packages that are automatically maintained using [AU](https://community.chocolatey.org/packages/au).
* icons - Where you keep icon files for the packages. This is done to reduce issues when packages themselves move around.
* manual - where packages that are not automatic are kept.

For setting up your own automatic package repository, please see [Automatic Packaging](https://docs.chocolatey.org/en-us/create/automatic-packages)

### Requirements

* Chocolatey (choco.exe)

#### AU

* PowerShell v5+.
* The [AU module](https://community.chocolatey.org/packages/au).

For daily operations check out the AU packages [template README](https://github.com/majkinetor/au-packages-template/blob/master/README.md).
