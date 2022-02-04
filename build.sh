#!/bin/sh

mkdir -p theme

for theme in dark_hard dark_medium dark_soft light_hard light_medium light_soft; do
  export $(cat "src/defines.env" "src/pallete_${theme}.env" | xargs)
  cat src/theme_header.xml src/includes/* src/theme_footer.xml | envsubst > theme/everforest_${theme}.xml
  cat src/everforest.theme.json | envsubst > theme/everforest_${theme}.theme.json
done