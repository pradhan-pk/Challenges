#!/bin/bash

grep ": Error\|Error:" DataFiles/WindowsEventLog.csv > error_logs.txt
grep "Warning" DataFiles/WindowsEventLog.csv > warning_logs.txt

echo "Applications that need attention - "
grep "Warning" DataFiles/WindowsEventLog.csv | 
    awk -F ',' '{print $3}' | sort -u | head -2