#!/bin/bash
#uninstall vim7.3
cd vim73
make uninstall
#uninstall vim zh help
cd ..
cd vimcdoc-1.8.0/
./vimcdoc.sh  -u
cd ..
