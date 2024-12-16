# Instruments

Instruments are the main building blocks in Csound. An instrument starts with the keyword `instr`, followed by a space, and a number or name. In case the numbers or names are separated by comma, the same instrument definition applies to different instrument numbers or names. The instrument definition ends with the keywor `endin`.

```
instr 10
  asig = poscil:a(0.2,400)
  outall(asig)
endin

instr 