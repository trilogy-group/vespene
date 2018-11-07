# Dockerization of Vespene

## [Vespene](https://vespene.io/)
[https://vespene.io/](https://vespene.io/)

Vespene is a reimagined build system and automation console, focused on ease of use and advanced capabilities. [Read More](https://github.com/trilogy-group/vespene/blob/master/README.md). <br> 

## [Vespene Repository](https://github.com/trilogy-group/vespene)
https://github.com/trilogy-group/vespene

## Docker Requirements
 1. Docker version 18.06.1-ce
 2. Docker compose version 1.22.0

## Runtime Depedencies
 1. [postgres 11](https://www.postgresql.org/) - [Docker](https://hub.docker.com/_/postgres/) 
 2. [python 3.7.1](https://www.python.org/) - [Docker](https://hub.docker.com/_/python/), This is being used as the base docker image for the [Dockerfile](Dockerfile)
 3. [python packages](requirements.txt)

## Artifacts
1. [Dockerfile](Dockerfile)<br>
    This file contains the instructions to build the docker image. Start from the base image of python.

2. [docker-compose.yml](docker-compose.yml)<br>
    This file contains the instructions to run all the development dependencies. Required by the product. [Read More](https://docs.docker.com/compose/overview/#compose-documentation). Basically creates two containers. 
     * postgres (database / db)
     * vespene (product)

3. [docker-database.py](docker-database.py)<br>
    Contains databae configuration for a typical Django app to run.

4. [docker-logging.py](docker-logging.py)<br>
    Contains logging configuration for a typical Django app to log onto the terminal.
    
5. [docker-readme.md](docker-readme.md)<br>
    Has instructions on how to use the above mentioned artifacts. 

6. [docker-run.sh](docker-run.sh)<br>
    Script to
    * migrate postgres and
    * run Django server at 0.0.0.0:8000

## Steps
1. `git clone https://github.com/trilogy-group/vespene/`
2. copy the artifacts in the repo directory
3. `docker-compose up`
4. open http://localhost:8000 to see vespene login ui

## Vespene Technical references
1. [Vespene Setup Guide](http://docs.vespene.io/setup.html)