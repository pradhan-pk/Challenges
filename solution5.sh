#!/bin/bash

grep -B1 -A49 "Type: Trade" DataFiles/opra_example_regression/opra_example_regression.log |
grep "wTradePrice\|wTradeVolume\|Record Publish" > trade_data.csv
