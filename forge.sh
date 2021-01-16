#!/bin/env bash
selection=$(./versions.sh | fzf)
url=$(curl "https://files.minecraftforge.net/maven/net/minecraftforge/forge/index_$selection.html" 2> /dev/null | xmllint --html --xpath "string(/html/body/main/div[2]/div[1]/div[2]/div/div[1]/div[2]/div[3]/a/@href)" - 2> /dev/null | cut -d "=" -f 3)
curl $url -o forge.jar
java -jar forge.jar
