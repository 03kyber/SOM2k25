#!/bin/bash

#get scite list and categorize

varprops=$(dpkg -L scite | grep -E -c ".properties")
echo "Number of .properties files: $varprops"

varstyled=$(dpkg -L scite | grep -E -c ".styled")
echo "Number of .styled files: $varstyled"

varfolded=$(dpkg -L scite | grep -E -c ".folded")
echo "Number of .folded files: $varfolded"

varso=$(dpkg -L scite | grep -E -c ".so")
echo "Number of .so files: $varso"

#get percentages

let total=varprops+varstyled+varfolded+varso
echo "Total number of files: $total"

propspercent=$(echo "scale=2; $varprops/$total*100"|bc)
echo "properties $propspercent percent"

styledpercent=$(echo "scale=2; $varstyled/$total*100"|bc)
echo "styled $styledpercent percent"

foldedpercent=$(echo "scale=2; $varfolded/$total*100"|bc)
echo "folded $foldedpercent percent"

soextpercent=$(echo "scale=2; $varso/$total*100"|bc)
echo "so $soextpercent percent"
