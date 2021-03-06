#!/bin/bash

declare -r ES_BIN_DIR="/usr/share/elasticsearch/bin"


install_plugins(){
  declare PLUGINS=(head:mobz/elasticsearch-head segmentspy:polyfractal/elasticsearch-segmentspy paramedic:karmi/elasticsearch-paramedic)

  for p in ${PLUGINS[@]}; do
    p_name=$(echo $p | cut -d ":" -f1)
    p_src=$(echo $p | cut -d ":" -f2)

    if [ $($ES_BIN_DIR/plugin -l | grep -c $p_name) == "0" ]; then
      echo "Installing plugin '$p_name'..."
      $ES_BIN_DIR/plugin -i $p_src
    fi

  done
}

start_es(){
  echo "Starting elasticsearch server..."
  $ES_BIN_DIR/elasticsearch
}

main(){
  install_plugins
  start_es
}


main