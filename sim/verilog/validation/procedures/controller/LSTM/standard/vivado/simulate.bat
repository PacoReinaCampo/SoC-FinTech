@echo off
call ../../../../../../../../settings64_vivado.bat

xvhdl -prj system.prj
xelab model_standard_lstm_testbench
xsim -R model_standard_lstm_testbench
pause
