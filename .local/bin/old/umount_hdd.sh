#!/bin/bash
swapoff /dev/sda4
umount /media/igor/data
hdparm -B 63 /dev/sda
