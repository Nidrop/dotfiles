#!/bin/bash
swapon /dev/sda4
mount /dev/sda3 /media/igor/data
hdparm -B 70 /dev/sda
