#!env bash

if [ "$(dunstctl is-paused)" = "true" ] ;then
   echo '<span color="#FF6363"> </span>'

else
    echo '<span color="#B2BCFB"> </span>'
fi

