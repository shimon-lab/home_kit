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

#cat a
cat $value
sleep ${off_time}s

#人感センサ反応　０
if [ $current_value -eq 0 ]
    then
#        cat f
        cat $value
        sleep ${stop_time}s
        irsend SEND_ONCE power.conf power_off

            while [ $current_value -eq 0 ]
            do
#                cat g
                current_value=`cat $value`
                prev_value=${current_value}
                cat $value
                sleep ${off_time}s
            done
    fi


#人感センサ反応　１
if [ $current_value -eq 1 ]
    then
#        cat b
        cat $value
        sleep ${stop_time}s
        irsend SEND_ONCE power.conf power_1
        sleep ${on_time}s

        while [ $current_value -eq 1 ]
        do
#            cat c
            current_value=`cat $value`
            prev_value=${current_value}
            cat $value

            if [ $current_value -eq 0 ]
            then
#              cat b

              current_value=`cat $value`
              prev_value=${current_value}
              cat $value
                if [ $current_value -eq 1 ]
                then
                  break
                fi
              sleep ${on_time}s

              current_value=`cat $value`
              prev_value=${current_value}
              cat $value
                if [ $current_value -eq 1 ]
                then
                  break
                fi
              sleep ${on_time}s

              current_value=`cat $value`
              prev_value=${current_value}
              cat $value
                if [ $current_value -eq 1 ]
                then
                  break
                fi
              sleep ${on_time}s

              current_value=`cat $value`
              prev_value=${current_value}
              cat $value
                if [ $current_value -eq 1 ]
                then
                  break
                fi
              sleep ${off_time}s

              cat $value
              sleep ${stop_time}s
              irsend SEND_ONCE power.conf power_off
              sleep ${on_time}s

              break

            fi

            sleep ${on_time}s
        done
      fi
