@echo off
echo. > solutions.txt
echo Paste your solutions below. Press Enter twice to finish.
setlocal EnableDelayedExpansion
:input_loop
set "line="
set /p "line="
if not defined line goto :end_input
echo !line!>>solutions.txt
goto :input_loop
:end_input
slidy length < solutions.txt > mylens.txt
slidy invert < solutions.txt | slidy apply-to-solved --size 3x3 > scrambles.txt
slidy solve < scrambles.txt | slidy length > optlens.txt
set sum_mylen=0
set sum_optlen=0
set total_count=0
set mylens_index=0
for /f "tokens=*" %%i in (mylens.txt) do (
    if "%%i" neq "" (
        if "%%i" neq "0" (
            set mylens[!mylens_index!]=%%i
            set /a sum_mylen+=%%i
            set /a mylens_index+=1
        )
    )
)
set optlens_index=0
for /f "tokens=*" %%j in (optlens.txt) do (
    if "%%j" neq "" (
        if "%%j" neq "0" (
            set optlens[!optlens_index!]=%%j
            set /a sum_optlen+=%%j
            set /a optlens_index+=1
        )
    )
)
set /a mylens_index=%mylens_index%-1
(for /l %%k in (0,1,%mylens_index%) do (
    set mylen=!mylens[%%k]!
    set optlen=!optlens[%%k]!
    set /a diff=mylen-optlen
    echo !diff!
    set /a total_count+=1
)) > diffs.txt
for /f "tokens=*" %%d in (diffs.txt) do (
    set /a count_diff_%%d+=1
)
for /f %%a in ('powershell -Command "$mylens = Get-Content mylens.txt | Where-Object { $_ -match '\S' -and $_ -ne '0' }; if ($mylens) { $avg = ($mylens | Measure-Object -Average).Average; '{0:N3}' -f $avg } else { '0' }"') do set avg_mylen=%%a
for /f %%a in ('powershell -Command "$optlens = Get-Content optlens.txt | Where-Object { $_ -match '\S' -and $_ -ne '0' }; if ($optlens) { $avg = ($optlens | Measure-Object -Average).Average; '{0:N3}' -f $avg } else { '0' }"') do set avg_optlen=%%a
for /f %%a in ('powershell -Command "$diff = [math]::Abs([double]::Parse('%avg_mylen%') - [double]::Parse('%avg_optlen%')); '{0:N3}' -f $diff"') do set avg_diff=%%a
set "avg_mylen=%avg_mylen:,=.%"
set "avg_optlen=%avg_optlen:,=.%"
set "avg_diff=%avg_diff:,=.%"
echo Total count: %total_count%
for /l %%d in (0,1,100000) do (
    if defined count_diff_%%d (
        echo +%%d: !count_diff_%%d!
    )
)
echo Average value of mylens.txt: %avg_mylen%
echo Average value of optlens.txt: %avg_optlen%
echo Difference between averages: %avg_diff%
:end
del diffs.txt
del mylens.txt
del optlens.txt
del scrambles.txt
del solutions.txt
endlocal
pause


