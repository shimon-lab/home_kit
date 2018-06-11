#!/usr/bin/perl
use Switch;
use Socket;
socket(SOCK, PF_INET, SOCK_STREAM, getprotobyname('tcp')) || die;
connect(SOCK, sockaddr_in(10500, inet_aton('localhost'))) || die;
$str = '';
while(1) {
    recv(SOCK, $message, 30, MSG_WAITALL);
    $str .= $message;
    if ($str =~ /\./) {
        print $str;
        switch($str) {
            case /つけて/ {
                system("irsend SEND_ONCE power.conf power_1");
            }
            case /けして/ {
                system("irsend SEND_ONCE power.conf power_off");
            }
            case /起動/ {
                system("wakeonlan -i 192.168.1.10 bc:5f:f4:fd:b8:ce");
            }
            case /回して/ {
                system("irsend SEND_ONCE power.conf fan_start");
            }
            case /止めて/ {
                system("irsend SEND_ONCE power.conf fan_stop");
            }
            case /NHK教育/ {
                system("irsend SEND_ONCE RMT-B007J 2");
            }
            case /日本テレビ/ {
                system("irsend SEND_ONCE RMT-B007J 4");
            }
            case /テレビ朝日/ {
                system("irsend SEND_ONCE RMT-B007J 5");
            }
            case /TBS/ {
                system("irsend SEND_ONCE RMT-B007J 6");
            }
            case /テレビ東京/ {
                system("irsend SEND_ONCE RMT-B007J 7");
            }
#            case /フジテレビ/ {
#                system("irsend SEND_ONCE RMT-B007J 8");
#            }
#            case /コンポ電源|コンポ点けて|コンポ消して/ {
#                system("irsend SEND_ONCE RAK-SC972WK power");
#            }
#            case /コンポ音量UP/ {
#                system("irsend SEND_ONCE RAK-SC972WK volup");
#            }
#            case /コンポ音量DOWN/ {
#                system("irsend SEND_ONCE RAK-SC972WK voldown");
#            }
#
#            case /テレビオン|テレビオン/ {
#                system("irsend SEND_ONCE tvshow.conf power");
#            }
#            case /ミュート/ {
#                system("irsend SEND_ONCE tvshow.conf mute");
#            }
#            case /地上波/ {
#                system("irsend SEND_ONCE tvshow.conf grand");
#            }
#            case /BS|ビーエス/ {
#                system("irsend SEND_ONCE tvshow.conf BS");
#            }
#            case /NHK総合|テレビ1/ {
#                system("irsend SEND_ONCE tvshow.conf 1");
#            }
#            case /NHK教育|テレビ2/ {
#                system("irsend SEND_ONCE tvshow.conf 2");
#            }
#            case /日本テレビ|テレビ4/ {
#                system("irsend SEND_ONCE tvshow.conf 4");
#            }
#            case /テレビ朝日|テレビ5/ {
#                system("irsend SEND_ONCE tvshow.conf 5");
#            }
#            case /TBS|テレビ6/ {
#                system("irsend SEND_ONCE tvshow.conf 6");
#            }
#           case /テレビ東京|テレビ7/ {
#               system("irsend SEND_ONCE tvshow.conf 7");
#            }
#           case /フジテレビ|テレビ8/ {
#                system("irsend SEND_ONCE tvshow.conf 8");
#            }
#            case /番組表/ {
#               system("irsend SEND_ONCE tvshow.conf tvprogram");
#            }
#            case /音量UP/ {
#                system("irsend SEND_ONCE tvshow.conf vol_up");
#            }
#            case /音量DOWN/ {
#                system("irsend SEND_ONCE tvshow.conf vol_down")
#            }
#            case /青/ {
#                system("irsend SEND_ONCE tvshow.conf blue")
#            }
#            case /赤/ {
#                system("irsend SEND_ONCE tvshow.conf red")
#            }
#            case /緑/ {
#                system("irsend SEND_ONCE tvshow.conf green")
#            }
#            case /黄色/ {
#                system("irsend SEND_ONCE tvshow.conf wellow")
#            }
#            case /上/ {
#                system("irsend SEND_ONCE tvshow.conf up")
#            }
#            case /下/ {
#                system("irsend SEND_ONCE tvshow.conf down")
#            }
#            case /左/ {
#                system("irsend SEND_ONCE tvshow.conf left")
#            }
#            case /右/ {
#                system("irsend SEND_ONCE tvshow.conf right")
#            }
#            case /CS/ {
#                system("irsend SEND_ONCE tvshow.conf CS")
#            }
#            case /dボタン/ {
#                system("irsend SEND_ONCE tvshow.conf d")
#            }
#            case /つけて/ {
#                system("irsend SEND_ONCE power.conf power_on");
#            }
#            case /けして/ {
#                system("irsend SEND_ONCE power.conf power_off");
#        　　}







        }
        $str = '';
    }
}
# SOCKET切断
close(SOCK);
