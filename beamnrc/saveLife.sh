#!/usr/bin/env sh

alias exb='$HEN_HOUSE/scripts/run_user_code_batch' 
dt=$(date +%F)

if [ ! -d log_of_exb ];then
  mkdir log_of_exb

  if [ -d log ];then
  echo "mkdir log_of_exb success!"
  fi
fi

for i in `ls *.egsinp`
do
  basename=${i%%.*}
  echo "Working on ${basename}"

  exb BEAM_MXR-601HP  ${i} pegsless p=5 >> ./log_of_exb/${dt}_${basename}.log 2>&1 
  sleep 1

  if [ -f ${basename}.lock ];then
    echo "Found ${basename}.lock, ${basename} success work!"
    echo " "
  fi
done
