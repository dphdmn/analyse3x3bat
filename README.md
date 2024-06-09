# analyse3x3bat

This tool is designed to analyze Fewest Moves Challenge (FMC) solves for 3x3 sliding puzzles using the Slidy CLI tool.

## Prerequisites

Make sure you have the Slidy CLI tool installed on your system. You can download it from [here](https://github.com/benwh1/slidy-cli/releases/tag/v0.3.0). Place the `slidy.exe` executable in your system's PATH or in the same folder as this script.

## Usage

1. **Input FMC Solves**: Run the script and paste your FMC solutions.

2. **Analysis**: The script will then analyze each solve using Slidy CLI and provide statistics.

## Example

```
Paste your solutions below. Press Enter twice to finish.
...
DRU2LD2RURUL2D2R2U2L2
LURDLDRUL2DRU2L
DLURULD2R2ULUL
L2DR2UL2DRULD2R2UL2DRU2LDRUL
RULRUL2DR2UL2DRDRULULD2RULU
D2L2UR2DLULU
<...>
LURULDLDR2UL2U
RDL2DRURDL2U2RD2LURUL
DRU2LDRURDLUL
LD2RULURDL2U

Total count: 100
+0: 70
+2: 16
+4: 4
+6: 7
+8: 1
+10: 1
+12: 1
Average value of mylens.txt: 22.200
Average value of optlens.txt: 21.000
Difference between averages: 1.200
Press any key to continue . . .
```
