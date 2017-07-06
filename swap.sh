#!/bin/bash
echo

echo "***** Used swap on OpenVZ VPS (requires sudo) *****"

echo

sudo cat /proc/user_beancounters | grep -E '(uid|physpages|oomguarpages)'

phy=`cat /proc/user_beancounters | grep " physpages " | awk '{print $2}'`
oomg=`cat /proc/user_beancounters | grep " oomguarpages " | awk '{print $2}'`

swap=$(($oomg-$phy))

swap_mem=$((swap*4096/1024/1024))

echo

echo "Current readings: $swap_mem MB"

echo

if [[ $swap_mem -le 0 ]]; then
  echo "No swapped memory is used at the moment";
  exit;
else 
echo "Used swap memory $swap_mem MB"
fi
