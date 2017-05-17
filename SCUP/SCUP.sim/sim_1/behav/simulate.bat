@echo off
set xv_path=D:\\study\\Vivado\\2015.2\\bin
call %xv_path%/xsim TEST_behav -key {Behavioral:sim_1:Functional:TEST} -tclbatch TEST.tcl -view D:/大二下/机组实验/SCUP/TEST_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
