<!--
id:fouti
category:Signal I/O:File I/O
-->
# fouti
Outputs i-rate signals of an arbitrary number of channels to a specified file.

## Syntax
``` csound-orc
fouti ihandle, iformat, iflag, iout1 [, iout2, iout3,....,ioutN]
```

### Initialization

_ihandle_ -- a number which specifies this file.

_iformat_ -- a flag to choose output file format:

*  0 - floating point in text format
*  1 - 32-bit floating point in binary format

_iflag_ -- choose the mode of writing to the ASCII file (valid only in ASCII mode; in binary mode _iflag_ has no meaning, but it must be present anyway). _iflag_ can be a value chosen among the following:

*  0 - line of text without instrument prefix
*  1 - line of text with instrument prefix (see below)
*  2 - reset the time of instrument prefixes to zero (to be used only in some particular cases. See below)

_iout,..., ioutN_ -- values to be written to the file

### Performance

_fouti_ and [foutir](../../opcodes/foutir) write i-rate values to a file. The main use of these opcodes is to generate a score file during a realtime session. For this purpose, the user should set _iformat_ to 0 (text file output) and _iflag_ to 1, which enable the output of a prefix consisting of the strings _inum_, _actiontime_, and _duration_, before the values of _iout1...ioutN_ arguments. The arguments in the prefix refer to instrument number, action time and duration of current note.

Notice that [fout](../../opcodes/fout) and [foutk](../../opcodes/foutk) can use either a string containing a file pathname, or a handle-number generated by [fiopen](../../opcodes/fiopen). Whereas, with _fouti_ and [foutir](../../opcodes/foutir), the target file can be only specified by means of a handle-number.

## Examples

Here is an example of the fouti opcode. It uses the file [fouti.csd](../../examples/fouti.csd).

``` csound-csd title="Example of the fouti opcode." linenums="1"
--8<-- "examples/fouti.csd"
```

## See also

[File Input and Output](../../sigio/fileio)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1999<br>

New in Csound version 3.56
