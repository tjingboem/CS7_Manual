<!--
id:cpstmid
category:Real-time MIDI:Converters
-->
# cpstmid
Get a MIDI note number (allows customized micro-tuning scales).

This unit is similar to [cpsmidi](../../opcodes/cpsmidi), but allows fully customized micro-tuning scales.

## Syntax
``` csound-orc
icps cpstmid ifn
```

### Initialization

_ifn_ -- function table containing the parameters (_numgrades_, _interval_, _basefreq_, _basekeymidi_) and the tuning ratios.

### Performance

Init-rate only

_cpsmid_ requires five parameters, the first, _ifn_, is the function table number of the tuning ratios, and the other parameters must be stored in the function table itself. The function table _ifn_ should be generated by [GEN02](../../scoregens/gen02), with normalization inhibited. The first four values stored in this function are:

1. _numgrades_ -- the number of grades of the micro-tuning scale
2. _interval_ -- the frequency range covered before repeating the grade ratios, for example 2 for one octave, 1.5 for a fifth etc.
3. _basefreq_ -- the base frequency of the scale in Hz
4. _basekeymidi_ -- the MIDI note number to which _basefreq_ is assigned unmodified

After these four values, the user can begin to insert the tuning ratios. For example, for a standard 12 note scale with the base frequency of 261 Hz assigned to the key number 60, the corresponding f-statement in the score to generate the table should be:

``` csound-sco
;          numgrades interval  basefreq basekeymidi tuning ratios (equal temp)
f1 0 64 -2   12       2        261        60         1  1.059463094359  1.122462048309  1.189207115003 ..etc...
```

Another example with a 24 note scale with a base frequency of 440 assigned to the key number 48, and a repetition interval of 1.5:

``` csound-sco
;           numgrades interval  basefreq basekeymidi tuning-ratios (equal temp)
f1 0 64 -2   24        1.5      440        48         1   1.01  1.02  1.03   ..etc...
```

## Examples

Here is an example of the cpstmid opcode. It uses the file [cpstmid.csd](../../examples/cpstmid.csd).

``` csound-csd title="Example of the cpstmid opcode." linenums="1"
--8<-- "examples/cpstmid.csd"
```

## See also

[Midi Converters](../../midi/convert)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1998<br>

New in Csound version 3.492
