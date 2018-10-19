#!/usr/bin/ksh
#
######################################################################
#                                                                    #
# Script : sendmail.ksh                                              #
# Author : Phil Cooper                                               #
# Date   : Dec 2016                                                  #
#                                                                    #
# Params : 1=name of log to email                                    #
#          2=SID                                                     #
#          3=Date                                                    #
#                                                                    #
# Desc   : Email log to user running report                          #
#          Send as HTML using font Courier New                       #
#                                                                    #
######################################################################
#
######################################################################
# Assign incoming parameters                                         #
######################################################################
#
LOG=$1
USID=$2
DT=$3
#
######################################################################
# Prepare email                                                      #
######################################################################
#
mailto=$(grep `who am i | cut -f1 -d' '` /etc/passwd | cut -f5 -d ':')
echo "Sending report to : $mailto"
#
######################################################################
# Send email                                                         #
######################################################################
#
cat $LOG | mailx -s "$USID : Java Security Checks $DT" $mailto
#
# END
#
