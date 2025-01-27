<!--
id:oscil3
category:Signal Generators:Basic Oscillators
-->
#oscil3
oscil3 - A simple oscillator with cubic interpolation.  

###Description
_oscil3_ reads table _ifn_ sequentially and repeatedly at a frequency _xcps_. The amplitude is scaled by _xamp_. Cubic interpolation is applied for table look up from internal phase values.  

###Syntax
```csound-orc
    ares oscil3 xamp, xcps [, ifn, iphs]
    kres oscil3 kamp, kcps [, ifn, iphs]
```

###Initialization
_ifn_ (optional) -- function table
      number. Requires a wrap-around guard point.  Defaults to -1
      indicating a sinewave.  
_iphs_ (optional) -- initial phase of sampling, expressed as a fraction of a cycle (0 to 1). A negative value will cause phase initialization to be skipped. The default value is 0.  

###Performance
_kamp, xamp_ -- amplitude  
_kcps, xcps_ -- frequency in cycles per second.  
_oscil3_ is identical to  [oscili](../oscili) , except that it uses cubic interpolation.  
Table _ifn_ is incrementally sampled modulo the table length and the value obtained is multiplied by _amp_.  
If you need to change the oscillator table with a k-rate signal, you can use  [oscilikt](../oscilikt) .  

###Examples
Here is an example of the oscil3 opcode. It uses the file  [oscil3.csd](../../examples/oscil3.csd).  

``` csound-csd title="Example of the oscil3 opcode" linenums="1"
<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o oscil3.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1

kamp = .6
kcps = 440
ifn  = p4

asig oscil kamp, kcps, ifn
     outs asig,asig

endin

instr 2

kamp = .6
kcps = 440
ifn  = p4

asig oscil3 kamp, kcps, ifn
     outs asig,asig

endin
</CsInstruments>
<CsScore>
f1 0 128 10 1                                          ; Sine with a small amount of data
f2 0 128 10 1 0.5 0.3 0.25 0.2 0.167 0.14 0.125 .111   ; Sawtooth with a small amount of data
f3 0 128 10 1 0   0.3 0    0.2 0     0.14 0     .111   ; Square with a small amount of data
f4 0 128 10 1 1   1   1    0.7 0.5   0.3  0.1          ; Pulse with a small amount of data

i 1  0 2 1
i 2  3 2 1
i 1  6 2 2
i 2  9 2 2
i 1 12 2 3
i 2 15 2 3
i 1 18 2 4
i 2 21 2 4

e
</CsScore>
</CsoundSynthesizer>
```

###See also
[Basic Oscillators](../../siggen/basic)  

###Credits
Author: John ffitch  
New in Csound version 3.50  
