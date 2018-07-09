# dcos-cli

DC/OS CLI with flexible server settings over environment variables and an autobuilder with a wide range of versions

## Usage

Use environment variables to control which server the DC/OS CLI connects to:

```sh
$ docker run -i -e 'DCOS_SERVER_URL=http://master1.dev.immo.example.com' gersilex/dcos-cli:1.9 marathon app list
[core.dcos_url]: set to 'http://master1.dev.immo.example.com'
ID                                        MEM   CPUS  TASKS  HEALTH  DEPLOYMENT  WAITING  CONTAINER  CMD
/demo-service                             768   0.2    1/1    1/1       ---      False      MESOS    None
/router                                   1024  0.5    1/1    1/1       ---      False      MESOS    None
[...]


$ docker run -i -e 'DCOS_SERVER_URL=http://master1.dev.immo.example.com' gersilex/dcos-cli:1.9 marathon app update "/demo-service" < marathon/staging.json
[core.dcos_url]: set to 'http://master1.dev.immo.example.com'
Created deployment 581862d9-3817-42e6-a3c9-98e9d78875d8
```

Note that there is no `dcos` command given, but only the Docker image repo and tag. The `dcos` command is ran implicitly by the `entrypoint.sh` script.

## Autobuild

Docker images are built automatically and in wide variations of versions using the build script `hooks/build`. Docker Hub builds these for us as soon as there are changes.

Currently there are only images built for `linux` and `x86-64` architectures based on the current `centos` image. Feel free to add more variations by adding them to `hooks/build` and `Dockerfile`. We happily accept pull requests.

## License

MIT License

Copyright (c) 2018 Immowelt Hamburg GmbH
