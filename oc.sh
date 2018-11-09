#!/bin/bash

X :1 &
export DISPLAY=:1

# ::Changable::
CLOCK=150
MEM=150
PL=70 # (PowerLimit)
FANSPEED=55

# ::Nvidia bin::
CMD='/usr/bin/nvidia-settings'
CMD2='/usr/bin/nvidia-smi'

for i in {0..10} # for 11 cards. Change 11 to the number of cards to OverClock
  do
  ${CMD} -a [gpu:${i}]/GPUPowerMizerMode=1
  ${CMD} -a [gpu:${i}]/GPUFanControlState=1
  ${CMD} -a [fan:${i}]/GPUTargetFanSpeed=${FANSPEED}

  for x in {3..3}
      do
            ${CMD} -a [gpu:${i}]/GPUGraphicsClockOffset[${x}]=${CLOCK}
            ${CMD} -a [gpu:${i}]/GPUMemoryTransferRateOffset[${x}]=${MEM}
            ${CMD2} -i ${i} -pl $PL
    done
done
