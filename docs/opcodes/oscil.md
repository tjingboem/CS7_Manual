<!--
id:oscil
category:Signal Generators:Basic Oscillators
-->
#oscil
oscil - A simple oscillator without any interpolation.  
###Description
_oscil_ reads table _ifn_ sequentially and repeatedly at a frequency _xcps_. The amplitude is scaled by _xamp_.  
###Syntax
```csound-orc
    ares oscil xamp, xcps [, ifn, iphs]
    kres oscil kamp, kcps [, ifn, iphs]
```
###Initialization
_ifn_ -- (optional) function table
      number. Requires a wrap-around guard point. The table number
      defaults to -1 which indicates a sinewave.  
_iphs_ (optional, default=0) -- initial phase of sampling, expressed as a fraction of a cycle (0 to 1). A negative value will cause phase initialization to be skipped. The default value is 0.  
###Performance
_kamp, xamp_ -- amplitude  
_kcps, xcps_ -- frequency in cycles per second.  
The _oscil_ opcode generates periodic control (or audio) signals consisting of the value of _kamp_ (_xamp_) times the value returned from control rate (audio rate) sampling of a stored function table. The internal phase is simultaneously advanced in accordance with the _kcps_ or _xcps_ input value.  
Table _ifn_ is incrementally sampled modulo the table length and the value obtained is multiplied by _amp_.  
If you need to change the oscillator table with a k-rate signal, you can use [oscilikt](../oscilikt) .  
> :memo: **Note**
> This opcode does not perform any interpolation. This can lead to unexpected behaviour or unclean signals, e.g. for small table sizes and low frequencies. As standard oscillators the usage of [oscili](../oscili) or [poscil](../poscil) is recommended.  

###Examples
Here is an example of the oscil opcode. It uses the file  [oscil.csd](../../examples/oscil.csd).

``` csound-csd title="Example of the oscil opcode" linenums="1"
<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o oscil.wav -W ;;; for file output any platform
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
</CsInstruments>
<CsScore>
f1 0 16384 10 1                                          ; Sine
f2 0 16384 10 1 0.5 0.3 0.25 0.2 0.167 0.14 0.125 .111   ; Sawtooth
f3 0 16384 10 1 0   0.3 0    0.2 0     0.14 0     .111   ; Square
f4 0 16384 10 1 1   1   1    0.7 0.5   0.3  0.1          ; Pulse

i 1 0 2 1
i 1 3 2 2
i 1 6 2 3
i 1 9 2 4

e
</CsScore>
</CsoundSynthesizer>
```

###See also
[Basic Oscillators](../../siggen/basic)  
