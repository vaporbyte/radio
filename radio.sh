#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Radio Selector"
TITLE="Radio Stations"
MENU="Choose one of the following stations:"

anonradio() {
  if [ -x $(which sox) ]; then
    trap 'printf "\n anonradio stream terminated... \n" && exit 0' 2
    clear
    while [ 1 ]
      do clear
      printf "\nSDF ANONradio - http://anonradio.net - ^C to cancel\n"
      sox -V0 -t mp3 http://anonradio.net:8000/anonradio.m3u -d
      sleep 5
    done
  else
    echo 'sox(1) not found or not executable - exiting...'
    exit 1
  fi
  exit 0
}

gpunkradio() {
  if [ -x $(which sox) ]; then
    trap 'printf "\n gpunkradio stream terminated... \n" && exit 0' 2
    clear
    while [ 1 ]
      do clear
      printf "\nGpunkradio - http://cyberadio.pw/ - ^C to cancel\n"
      sox -V0 -t mp3 http://cyberadio.pw:8000/stream -d
      sleep 5
    done
  else
    echo 'sox(1) not found or not executable - exiting...'
    exit 1
  fi
  exit 0
}

cyberia() {
  if [ -x $(which sox) ]; then
    trap 'printf "\n cyberia stream terminated... \n" && exit 0' 2
    clear
    while [ 1 ]
      do clear
      printf "\ncyberia - https://lainon.life/ - ^C to cancel\n"
      sox -V0 -t ogg https://lainon.life/radio/everything.ogg -d
      sleep 5
    done
  else
    echo 'sox(1) not found or not executable - exiting...'
    exit 1
  fi
  exit 0
}

OPTIONS=(1 "AnonRadio"
         2 "GpunkRadio"
         3 "Cyberia")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
        	  anonradio
            ;;
        2)
            gpunkradio
            ;;
        3)
            cyberia
            ;;
esac
