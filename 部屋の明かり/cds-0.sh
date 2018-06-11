#!/bin/bash

#人感センサーモジュール

sensor=25       #sensor
on_time=4      #on time
off_time=0.4      #off_time
stop_time=0.1

if [ ! -d /sys/class/gpio/gpio${sensor} ]
then
  echo $sensor > /sys/class/gpio/export
fi

value=/sys/class/gpio/gpio${sensor}/value  #sensor の値
prev_value=`cat $value`

current_value=`cat $value`
prev_value=${current_value}
cat $value
#cat a

    if [ $current_value -eq 1 ]
    then
#       cat b
        cat $value
        sleep ${stop_time}s
        irsend SEND_ONCE power.conf power_1
fi
