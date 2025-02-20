#!/bin/sh

envFile=~/.config/polybar/scripts/env.sh
changeValue=300

changeMode() {
  sed -i "s/REDSHIFT=$1/REDSHIFT=$2/g" $envFile 
  REDSHIFT=$2
  echo $REDSHIFT
}

changeTemp() {
  if [ "$2" -gt 2000 ] && [ "$2" -lt 25000 ]
  then
    sed -i "s/REDSHIFT_TEMP=$1/REDSHIFT_TEMP=$2/g" $envFile 
    redshift -P -O $((REDSHIFT_TEMP+changeValue))
  fi
}

case $1 in 
  toggle) 
    if [ "$REDSHIFT " = on ];
    then
      changeMode "$REDSHIFT " off
      redshift -x y redshift -O "$REDSHIFT_TEMP " 
    else
      changeMode "$REDSHIFT " on
      redshift -x
    fi
    ;;
  increase)
    changeTemp $((REDSHIFT_TEMP)) $((REDSHIFT_TEMP+changeValue))
    ;;
  decrease)
    changeTemp $((REDSHIFT_TEMP)) $((REDSHIFT_TEMP-changeValue));
    ;;
  temperature)
    case $REDSHIFT in
      on)
        printf "%dK " "$REDSHIFT_TEMP"
        ;;
      off)
        printf "off"
        ;;
    esac
    ;;
esac