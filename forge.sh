#!/bin/sh
function versions() {
  list=$(curl https://files.minecraftforge.net/ -q 2> /dev/null | xmllint --xpath "/html/body/main/div[1]/aside/section//li" --html - 2> /dev/null | grep "<a href=\"/\|elem-active")
  versions=""
  while IFS= read -r line; do
    versions="${versions}$(printf "$line" | xmllint --xpath "string(.)" -)\n"
  done <<< "$list"
}

versions
selection=$(printf "$versions" | sort -uVr |  fzf)
url=$(curl "https://files.minecraftforge.net/maven/net/minecraftforge/forge/index_$selection.html" 2> /dev/null | xmllint --html --xpath 'string(/html/body/main/div[2]/div[1]/div[2]/div/div[1]/div[2]//*[@title = "Installer"]/@href)' - 2> /dev/null | cut -d "=" -f 3)
echo $url
curl $url -o forge.jar
java -jar forge.jar


