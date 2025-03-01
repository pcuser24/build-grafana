# Virtual machine setup for building Grafana from source code

This repository contains a Vagrantfile and a set of PowerShell scripts to create a virtual machine for building Grafana v6.3.4.

## Instructions

- [Grafana v6.3.4 building instruction](https://github.com/grafana/grafana/tree/v6.3.4)
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
  - Frontend:
    - Build stage:
  
    ```powershell
    > yarn install --pure-lockfile
    warning Error running install script for optional dependency: "C:\\Users\\vagrant\\grafana\\node_modules\\iltorb: Command failed.
    Exit code: 1
    Command: detect-libc prebuild-install || node-gyp rebuild
    Arguments:
    Directory: C:\\Users\\vagrant\\grafana\\node_modules\\iltorb
    Output:
    prebuild-install WARN install No prebuilt binaries found (target=10.24.1 runtime=node arch=x64 platform=win32)
    gyp info it worked if it ends with ok
    gyp info using node-gyp@3.8.0
    gyp info using node@10.24.1 | win32 | x64
    gyp ERR! configure error
    gyp ERR! stack Error: Can't find Python executable \"python\", you can set the PYTHON env variable.
    gyp ERR! stack     at PythonFinder.failNoPython (C:\\Users\\vagrant\\grafana\\node_modules\\node-gyp\\lib\\configure.js:484:19)
    gyp ERR! stack     at PythonFinder.<anonymous> (C:\\Users\\vagrant\\grafana\\node_modules\\node-gyp\\lib\\configure.js:509:16)
    gyp ERR! stack     at C:\\Users\\vagrant\\grafana\\node_modules\\graceful-fs\\polyfills.js:282:31
    gyp ERR! stack     at FSReqWrap.oncomplete (fs.js:153:21)
    gyp ERR! System Windows_NT 10.0.19045
    gyp ERR! command \"C:\\\\Program Files\\\\nodejs\\\\node.exe\" \"C:\\\\Users\\\\vagrant\\\\grafana\\\\node_modules\\\\node-gyp\\\\bin\\\\node-gyp.js\" \"rebuild\"
    gyp ERR! cwd C:\\Users\\vagrant\\grafana\\node_modules\\iltorb
    gyp ERR! node -v v10.24.1
    gyp ERR! node-gyp -v v3.8.0
    gyp ERR! not ok"
    info This module is OPTIONAL, you can safely ignore this error
    Done in 75.10s.
    ```

    => WARNING: This is a warning of an optional dependency, so it can be ignored.
  - Backend:
    - Build stage:

    ```powershell
    > go run build.go build
    GOPATH is C:\
    Version: 6.3.4, Linux Version: 6.3.4, Package Iteration: 1740813674
    go install -v ./pkg/cmd/grafana-server
    golang.org/x/xerrors
    golang.org/x/xerrors
    C:\pkg\mod\golang.org\x\xerrors@v0.0.0-20190410155217-1f06c39b4373\adaptor_go1_13.go:16:21: undefined: errors.Frame
    C:\pkg\mod\golang.org\x\xerrors@v0.0.0-20190410155217-1f06c39b4373\adaptor_go1_13.go:21:42: undefined: errors.Caller
    C:\pkg\mod\golang.org\x\xerrors@v0.0.0-20190410155217-1f06c39b4373\format_go1_13.go:12:25: undefined: errors.Formatter
    C:\pkg\mod\golang.org\x\xerrors@v0.0.0-20190410155217-1f06c39b4373\format_go1_13.go:19:23: undefined: errors.Printer
    # github.com/mattn/go-sqlite3
    sqlite3-binding.c: In function 'sqlite3SelectNew':
    sqlite3-binding.c:123303:10: warning: function may return address of local variable [-Wreturn-local-addr]
    123303 |   return pNew;
          |          ^~~~
    sqlite3-binding.c:123263:10: note: declared here
    123263 |   Select standin;
          |          ^~~~~~~
    exit status 1
    exit status 1
    ```

    => WARNING. [Recommended fix](https://github.com/golang/go/issues/32246#issuecomment-509015308): replace current version `golang.org/x/xerrors` with `v0.0.0-20190528162220-0421b64034aa` in `go.mod` file.

    - Run stage:

    ```powershell
    > make run
    File not found - *.sh
    The system cannot find the path specified.
    make: *** [scripts/go/bin/bra] Error 1
    ```

    => ERROR: Source code is missing
