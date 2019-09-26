#!/bin/bash
mv package.box package-til-$(DATE +%Y-%M-%d).box
vagrant package
scp package.box cache@cig-dev.ninezh.cc:~/
