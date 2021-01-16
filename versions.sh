#!/bin/env bash
#set -x
list=$(curl https://files.minecraftforge.net/ -q 2> /dev/null | xmllint --xpath "/html/body/main/div[1]/aside/section//li" --html - 2> /dev/null | /bin/grep "<a href=\"/\|elem-active")
while IFS= read -r line; do
  printf "$line" | xmllint --xpath "string(.)" -
done <<< "$list"
