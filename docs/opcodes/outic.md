<!--
id:outic
category:Real-time MIDI:Output
-->
# outic
Sends MIDI controller output at i-rate.

## Syntax
``` csound-orc
outic ichn, inum, ivalue, imin, imax
```

### Initialization

_ichn_ -- MIDI channel number (1-16)

_inum_ -- controller number (0-127 for example 1 = ModWheel; 2 = BreathControl etc.)

_ivalue_ -- floating point value

_imin_ -- minimum floating point value (converted in MIDI integer value 0)

_imax_ -- maximum floating point value (converted in MIDI integer value 127 (7 bit))

### Performance

_outic_ (i-rate MIDI controller output) sends controller messages to the MIDI OUT device. It works only with MIDI instruments which recognize them. It can drive a different value of a parameter for each note currently active.

It can scale an i-value floating-point argument according to the _imin_ and _imax_ values. For example, set _imin_ = 1.0 and _imax_ = 2.0. When the _ivalue_ argument receives a 2.0 value, the opcode will send a 127 value to the MIDI OUT device. When the _ivalue_ argument receives a 1.0 value, it will send a 0 value. i-rate opcodes send their message once during instrument initialization.

## Examples

Here is an example of the outic opcode. It uses the file [outic.csd](../../examples/outic.csd).

``` csound-csd title="Example of the outic opcode." linenums="1"
--8<-- "examples/outic.csd"
```

## See also

[MIDI Message Output](../../midi/output)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.47

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
