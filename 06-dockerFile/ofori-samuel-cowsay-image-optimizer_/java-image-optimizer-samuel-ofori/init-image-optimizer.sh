#!/bin/bash
docker build -t images-optimizer:1.0.1 .
docker run -d -v "$PWD"/imgs-in:images/in -v "$PWD"/images/out --name=image-optimizer image-optimizer:1.0.1

