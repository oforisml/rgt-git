#!/bin/sh

docker build -t cowsay:1.0.1 .

docker run -dp 4001:3001 cowsay:1.0.1
