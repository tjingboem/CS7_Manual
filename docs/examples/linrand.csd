<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o linrand.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1         ; every run time same values

klin    linrand 100
        printk .2, klin                 ; look 
aout    oscili 0.8, 440+klin, 1         ; & listen
        outs    aout, aout
endin

instr 2         ; every run time different values

        seed 0
klin    linrand 100
        printk .2, klin                 ; look 
aout    oscili 0.8, 440+klin, 1         ; & listen
        outs    aout, aout
endin

</CsInstruments>
<CsScore>
; sine wave
f 1 0 16384 10 1

i 1 0 2
i 2 3 2
e
</CsScore>
</CsoundSynthesizer>