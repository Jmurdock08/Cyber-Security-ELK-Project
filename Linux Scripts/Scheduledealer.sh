#!/bin/bash
awk '{print $1,$2,$5,$6}' $1_Dealer_schedule | grep -E '05:00:00 AM|08:00:00 AM|02:00:00 PM|08:00:00 PM|11:00:00 PM' >> Dealers_working_during_losses.txt
