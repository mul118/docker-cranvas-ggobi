# docker-cranvas-ggobi

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![ Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/mul118/docker-cranvas-ggobi)](https://hub.docker.com/r/mul118/docker-cranvas-ggobi)


Docker image containing a browser-accessible Ubuntu installation with included Rstudio Desktop, and cranvas interactive exploratory data analysis library.


## Quick Start

From command line, run

``` bash
docker run -p 6080:80 -v [YOUR LOCAL WORKING DIRECTORY]:/root/work docker-cranvas-ggobi
```

Then, browse to http://127.0.0.1:6080/ . Open Rstudio and attach the cranvas library. Enjoy!

## Build

To build the docker image, navigate to the root laminar directory and type:


``` bash
docker build -t docker-cranvas-ggobi .
```

