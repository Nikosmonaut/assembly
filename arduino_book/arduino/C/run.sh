#!/bin/bash

screen -X quit;
make clean;
make;
make install;
