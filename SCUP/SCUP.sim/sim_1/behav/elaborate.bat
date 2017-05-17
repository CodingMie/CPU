@echo off
set xv_path=D:\\study\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 28be94c8f0b7475ca9eed0f96905d2b1 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot TEST_behav xil_defaultlib.TEST xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
