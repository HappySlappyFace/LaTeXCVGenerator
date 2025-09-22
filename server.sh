#!/bin/bash
zathura main.pdf & latexmk -pdf -pvc main.tex 
