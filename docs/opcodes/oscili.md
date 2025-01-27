<!--
id:oscili
category:Signal Generators:Basic Oscillators
-->
#oscili
oscili - A simple oscillator with linear interpolation.  

###Description
_oscili_ reads table _ifn_ sequentially and repeatedly at a frequency _xcps_. The amplitude is scaled by _xamp_. Linear interpolation is applied for table look up from internal phase values.  

###Syntax
```csound-orc
    ares oscili xamp, xcps[, ifn, iphs]
    kres oscili kamp, kcps[, ifn, iphs]
```

###Initialization
_ifn_(optional) -- function table number. Requires a wrap-around guard point. The table number defaults to -1 which indicates a sine wave.  
_iphs_ (optional) -- initial phase of sampling, expressed as a fraction of a cycle (0 to 1). A negative value will cause phase initialization to be skipped. The default value is 0.  

###Performance
_kamp, xamp_ -- amplitude  
_kcps, xcps_ -- frequency in cycles per second.  
_oscili_ differs from  [oscil](../oscil)  in that the standard procedure of using a truncated phase as a sampling index is here replaced by a process that interpolates between two successive lookups. Interpolating generators will produce a noticeably cleaner output signal, but they may take as much as twice as long to run. Adequate accuracy can also be gained without the time cost of interpolation by using large stored function tables of 2K, 4K or 8K points if the space is available.  
Table _ifn_ is incrementally sampled modulo the table length and the value obtained is multiplied by _amp_.  
If you need to change the oscillator table with a k-rate signal, you can use  [oscilikt](../oscilikt) .  

###Examples
Here is an example of the oscil3 opcode. It uses the file [oscili.csd](../../examples/oscili.csd).  

``` csound-csd title="Example of the oscili opcode" linenums="1"
<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o oscili.wav -W ;;; for file output any platform
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

asig oscili kamp, kcps, ifn
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

