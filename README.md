rtfft
=====

This uses the Synthesis ToolKit (https://ccrma.stanford.edu/software/stk/) to generate real time waveforms and audio.
This uses the clFFT (https://github.com/clMathLibraries/clFFT) to do frequency analysis on the GPU.

The data can be plotted in realtime with GNUPLOT:
```bash
$ ./build/rtfft | gnuplot
```
