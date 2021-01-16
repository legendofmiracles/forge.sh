#!/bin/env bash
#set -x
list=$(curl https://files.minecraftforge.net/ -q 2> /dev/null | xmllint --xpath "/html/body/main/div[1]/aside/section//a" --html - 2> /dev/null | /bin/grep "<a href=\"/")
while IFS= read -r line; do
  printf "$line" | xmllint --xpath "string(//a)" -
done <<< "$list"
