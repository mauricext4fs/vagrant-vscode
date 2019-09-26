#!/bin/bash
mv package.box package-til-$(DATE).box
vagrant package
scp package.box cache@cig-dev.ninezh.cc:~/
