#!/bin/bash

scp -r -P 8022 ~/Desktop/git/group_0017/A1/* student@localhost:/home/student/Assignment1
ssh -p 8022 student@localhost 'cd /home/student/Assignment1; make clean; make'
echo "Successfully copied src files and compiled."
