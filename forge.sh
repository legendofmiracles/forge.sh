#!/bin/env bash
set -x
selection=$(./versions.sh | sort -uVr |  fzf)
url=$(curl "https://files.minecraftforge.net/maven/net/minecraftforge/forge/index_$selection.html" 2> /dev/null | xmllint --html --xpath 'string(/html/body/main/div[2]/div[1]/div[2]/div/div[1]/div[2]//*[@title = "Installer"]/@href)' - 2> /dev/null | cut -d "=" -f 3)
echo $url
curl $url -o forge.jar
java -jar forge.jar
