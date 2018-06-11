#!/bin/bash

sensor=25       #sensor
on_time=1      #on time
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
sleep ${stop_time}s

# -eq : equal
j=0
while [  $current_value -eq 0 ]
do
   sleep ${on_time}s
   current_value=`cat $value`
   prev_value=${current_value}
   cat $value
   j=`expr $j + 1`
   if [ $j -eq 30 ]
   then
       sleep ${stop_time}s
       irsend SEND_ONCE power.conf power_off
       break
   fi
done
