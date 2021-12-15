#!/usr/bin/bash
iptables -t mangle -A POSTROUTING -j TTL --ttl-set 65
