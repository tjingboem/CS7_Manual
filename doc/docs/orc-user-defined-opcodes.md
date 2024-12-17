# User Defined Opcodes (UDO)

User Defined Opcodes are functions written in Csound code. They are located in the global space of the orchestra code, or loaded in a text file via `#include`.

The definition of a User Defined Opcode starts with the keyword `opcode` and ends with the keyword `endop`. The syntax and implementation of UDOs has changed in Csound 7; so there are two different syntax conventions which can be used.

## Old style UDO definition

The implementation is described in detail in the manual page for `opcode` (link to that page).

## New style UDO definition

(to be written, including the pass-by-reference as distinction to old style UDOs)