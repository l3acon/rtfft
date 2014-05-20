rtfft
=====

This uses the Synthesis ToolKit (https://ccrma.stanford.edu/software/stk/) to generate real time waveforms and audio.
This uses the clFFT (https://github.com/clMathLibraries/clFFT) to do frequency analysis on the GPU.

If you don't have a midi keyboard I reccommend "Easy Midi FREE" from the iTunes App Store.

The data can be plotted in realtime with GNUPLOT:
```bash
$ ./build/rtfft -o | gnuplot
```


To Do
=====
Use a faster plot (maybe SDL) GNUPLOT is too slow somehow.

Add back in the ability to use the keyboard as input device.

Ability to disable FFT output.


