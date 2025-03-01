# Virtual machine setup for building Grafana from source code

This repository contains a Vagrantfile and a set of PowerShell scripts to create a virtual machine for building Grafana v11.5.2 from source code.

## Instructions

- [Grafana v11.5.2 building instruction](https://github.com/grafana/grafana/blob/HEAD/contribute/developer-guide.md)
- Order of installation:
  - [Git](shared_folder/git.ps1)
  - [Golang](shared_folder/golang.ps1)
  - [Node.js](shared_folder/nodejs.ps1)
  - [Build dependencies](shared_folder/build_dependencies.ps1) (This step should be done manually, follow the instructions in the script to install MinGW and GNU Make)
  - [Build script](shared_folder/build.ps1)

## Notes

- [Template for running script with administrator privillege](shared_folder/sudo.ps1)
- Installation of MinGW and GNU should be done manually. GNU binary directory should be added to the PATH environment variable.
- Errors / Warning:
  - Frontend: None
  - Backend:
    - Run stage:

    ```PowerShell
    > make run
    '[' is not recognized as an internal or external command,
    operable program or batch file.
    'tr' is not recognized as an internal or external command,
    operable program or batch file.
    'grep' is not recognized as an internal or external command,
    operable program or batch file.
    File not found - *.sh
    compose was unexpected at this time.
    FIND: Parameter format not correct
    process_begin: CreateProcess(NULL, # Install binary/ries using Go 1.14+ build command. This is using bwplotka/bingo-controlled, separate go module with pinned dependencies., ...) failed.       
    make (e=2): The system cannot find the file specified.
    make: *** [C/bin/bra-v0.0.0-20200517080246-1e3013ecaff8] Error 2
    ```

    => ERROR.
