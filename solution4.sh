#!/bin/bash

grep '^[0-9].*'  DataFiles/hosts.real | 
awk 'BEGIN {OFS="\t"}{print $2,$1}' |
sed '1i\Host names \t\t IP Address'
