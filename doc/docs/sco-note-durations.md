# Note Event Durations

The third parameter field in a note event (accessible as `p3` in the called instrument) sets the duration of the instrument instance. However, there are some notable cases and features, in particular negative duration.

## Overwriting the Duration in the Instrument

This is a simple but versatile feature. Any duration given by the note event can be overwritten inside the instrument:

```
instr 1
  p3 = 2
  aSig = oscili:a(.2,300)
  outall(aSig)
endin
schedule(1,0,100)
```

## Zero Duration

Calling an instrument with duration zero means that only the inilialization pass is executed.

```
instr 1
  // this will be printed
  prints("i-rate\n")
  // this will not be printed
  printks("k-rate\n",0)
endin
schedule(1,0,0)
```

## Negative Duration

### Legato or Tied Notes

Basically, negative duration (usually `-1`) was introduced into Csound as feature for tied notes. If one instance is called with a negative duration, the next call will continue this instance.

```
instr 1
  aSig = poscil:a(0.2,p4)
  outall(aSig)
endin
schedule(1,0,-1,400)
schedule(1,1.1,-1,500)
schedule(1,2.2,1,444)
```

## Allowing More Than One Instance 

It is possible to run several instances called by negative duration at the same time when these instances are called with different fractional numbers.

```
<CsoundSynthesizer> 
<CsOptions> 
-odac
</CsOptions> 
<CsInstruments> 
instr 1
  aSig = poscil:a(0dbfs/5,p4)
  outall(aSig)
endin
</CsInstruments> 
<CsScore>
// normal behaviour: only one instance
i 1 0 -1 400
i 1 1 -1 500
i 1 2  1 444
s
// explicit instances: simultaneous instances
i 1.01 1 -1 400
i 1.02 2 -1 500
i 1.03 3  1 444
</CsScore> 
</CsoundSynthesizer> 
```


### One Single Negative Duration 

If there is only one negative duration, the called instrument instance will play for an indefinite duration; in other words: as long as Csound is running.

```
<CsoundSynthesizer> 
<CsOptions> 
-odac
</CsOptions> 
<CsInstruments> 
instr 1
  aSig = poscil:a(0dbfs/5,400)
  outall(aSig)
endin
schedule(1,0,-1)
</CsInstruments> 
<CsScore>
</CsScore> 
</CsoundSynthesizer> 
```

This code runs "endlessly" because the score section is empty. Putting the note event in the score will terminate Csound immediately as -1 is no duration and the last score event defines the overall duration of Csound's performance.

```
<CsoundSynthesizer> 
<CsOptions> 
-odac
</CsOptions> 
<CsInstruments> 
instr 1
  aSig = poscil:a(0dbfs/5,400)
  outall(aSig)
endin
</CsInstruments> 
<CsScore>
i 1 0 -1
</CsScore> 
</CsoundSynthesizer> 
```

There must be a `e` or `f0` statement followed by a positive duration to prevent this termination.

```
<CsoundSynthesizer> 
<CsOptions> 
-odac
</CsOptions> 
<CsInstruments> 
instr 1
  aSig = poscil:a(0dbfs/5,400)
  outall(aSig)
endin
</CsInstruments> 
<CsScore>
i 1 0 -1
e 10
</CsScore> 
</CsoundSynthesizer> 
```


## Summary

1. If an instrument is called twice with negative duration, the second call will terminate the first instance.  
2. Only if fractional instrument numbers are used. several instances can be run simultaneously.  
3. One single instance will run as long as Csound runs.