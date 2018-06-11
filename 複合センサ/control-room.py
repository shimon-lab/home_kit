import distance
import cds
import human
import time
import commands

while True:
        i=0
        time.sleep(0.5)
        print cds.cds(0)
        if cds.cds(0) <=50:
            time.sleep(0.5)

            if human.human(0) ==1:
                check = commands.getoutput("irsend SEND_ONCE power.conf power_1")
                print check
                time.sleep(0.2)

        elif cds.cds(0) >=150:
            time.sleep(60)

        elif cds.cds(0) >50 and cds.cds(0) <150:
            time.sleep(2)
            print human.human(0)
            while human.human(0) ==0:
                time.sleep(1)
                i += 1
                print distance.reading(0)
                if i >=6 and distance.reading(0) < 80:
                    time.sleep(0.5)
                    break

                if i >=8 and distance.reading(0) > 80:
                    check = commands.getoutput("irsend SEND_ONCE power.conf power_off")
                    print check
                    time.sleep(0.2)
                    break
