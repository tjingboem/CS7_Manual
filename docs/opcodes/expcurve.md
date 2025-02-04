<!--
id:expcurve
category:Signal Generators:Linear and Exponential Generators
-->
# expcurve
This opcode implements a formula for generating a normalised exponential curve in range 0 - 1. It is based on the Max / MSP work of Eric Singer (c) 1994.

Generates an exponential curve in range 0 to 1 of arbitrary steepness. Steepness index less than 1.0 would result in Not-a-Number errors and cause unstable behavior so is treated as if it were 1.

The formula used to calculate the curve is:
```
 (exp(x * log(y))-1) / (y-1)
```
where x is equal to _kindex_ and y is equal to _ksteepness_.

## Syntax
```csound-orc
kout expcurve kindex, ksteepness
```

### Performance
_kindex_ -- Index value. Expected range 0 to 1.

_ksteepness_ -- Steepness of the generated curve. Values
      closer to 1.0 result in a straighter line while larger values steepen the
      curve.

_kout_ -- Scaled output.

## Examples
Here is an example of the expcurve opcode. It uses the file [expcurve.csd](../../examples/expcurve.csd).
``` csound-orc title="Example of the expcurve opcode." linenums="1"
--8<-- "examples/expcurve.csd"
```

## See also
[Linear and Exponential Generators](../../siggen/lineexp)

## Credits
Author: David Akbari  
October  
2006

Range check introduced in 6.16 by John ffitch
