# Data Types and Variables

## Implicit Types

Data types in Csound 6 and earlier were declared using abbreviations. These abbreviations were integrated in variables names. (Local variables have their scope in one instrument. Global variables can be accessed and altered in any instrument or in the global space.)

| Local | Global | Data type | Updated at | Examples
| ------ | --------- | --------- | ---------- | ------- |
| **i** | **gi** | number | initalization (i-rate) | `iFreq` `giTable` |
| **k** | **gk** | number | control cycle (k-rate) | `kAmp` `gkCount` |
| **a** | **ga** | number | audio sample (a-rate) | `aOut` `gaReverb` |
| **S** | **gS** | string | i-rate or k-rate | `S_file` `gS_host` |
| **f** | **gf** | spectral | k-rate | `fSig` `gfSig` |
| **w** | - | spectral (old) | k-rate | - |
| **i[]** | **gi[]** | array | i-rate | `iArr[]` `giArr[]` |
| **k[]** | **gk[]** | array | k-rate | `kArr[]` `gkArr[]` |


## Explicit Types

In Csound 7 the data type can be given explicitely, without being bound to the name. 

```
freq:i = 442
amp:k = linen:k(1,.1,p3,.1)
sine:a = poscil:a(.2,400)
[CONTINUE]
```

## Constants and Reserved Symbols

Constants are available continuously and do not change in value. Usually they are connected with reserved symbols and written in the orchestra header:

```
sr = 44100
ksmps = 64
0dbfs = 1
nchnls = 2
```

