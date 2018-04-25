onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib PmodBT2_0_opt

do {wave.do}

view wave
view structure
view signals

do {PmodBT2_0.udo}

run -all

quit -force
