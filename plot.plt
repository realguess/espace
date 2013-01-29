#!/usr/bin/env gnuplot
#
# Plot, save and push.
##

set terminal png nocrop enhanced size 640,320
set timefmt '%H:%M'
set xdata time
set xrange ['00:00':'23:59']
set xtics '00:00','04:00'
set xtics format '%H:%M'
set yrange [0:100]
set xlabel 'time'
set ylabel 'received'
set output 'plot.png'
set nokey
set grid
plot 'data/latest.csv' using 3:4 with linespoints
