#!/bin/bash

docker-compose run web rake db:create;
docker-compose up --build;
