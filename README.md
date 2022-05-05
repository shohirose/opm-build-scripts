# opm-build-scripts
Bash scripts to build and install [OPM](https://opm-project.org/) modules from source on Ubuntu. The current OPM version is 2021.10.

# How to use

You can install all of the OPM modules by

```terminal
$ ./install_prerequisites.sh
$ ./install_fmt.sh
$ ./install_opm.sh
```

Modules will be installed under `$HOME/opm-VERSION` by default, where VERSION is the OPM release version. The install directory can be changed with `--prefix` option:

``` terminal
$ ./install_opm.sh --prefix PATH
```

You can install a particular module by passing the module name:

```terminal
$ ./install_opm.sh common
```
