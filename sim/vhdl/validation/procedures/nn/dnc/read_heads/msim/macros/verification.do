#*************************
# VERIFICATION
#*************************

do variables.do

mkdir wlf

##################################################################################################
# TEST SOURCES ###################################################################################
##################################################################################################

##################################################################################################
# ACCELERATOR_FREE_GATES_TEST 
##################################################################################################

alias model_free_gates_verification_compilation {
  echo "TEST: ACCELERATOR_FREE_GATES_TEST"

  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/read_heads/model_read_heads_pkg.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/read_heads/model_read_heads_stimulus.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/read_heads/model_read_heads_testbench.vhd

  vsim -g /model_read_heads_testbench/ENABLE_ACCELERATOR_FREE_GATES_TEST=true -t ps +notimingchecks -L unisim work.model_read_heads_testbench

  #MACROS
  add log -r sim:/model_read_heads_testbench/*

  #WAVES
  view -title model_free_gates wave
  do $simulation_path/model/dnc/read_heads/msim/waves/model_free_gates.do

  force -freeze sim:/model_read_heads_pkg/STIMULUS_ACCELERATOR_FREE_GATES_TEST true 0
  force -freeze sim:/model_read_heads_pkg/STIMULUS_ACCELERATOR_FREE_GATES_CASE_0 true 0

  onbreak {resume}
  run -all

  dataset save sim wlf/model_free_gates_test.wlf
}

##################################################################################################
# ACCELERATOR_READ_KEYS_TEST 
##################################################################################################

alias model_read_keys_verification_compilation {
  echo "TEST: ACCELERATOR_READ_KEYS_TEST"

  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/read_heads/model_read_heads_pkg.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/read_heads/model_read_heads_stimulus.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/read_heads/model_read_heads_testbench.vhd

  vsim -g /model_read_heads_testbench/ENABLE_ACCELERATOR_READ_KEYS_TEST=true -t ps +notimingchecks -L unisim work.model_read_heads_testbench

  #MACROS
  add log -r sim:/model_read_heads_testbench/*

  #WAVES
  view -title model_read_keys wave
  do $simulation_path/model/dnc/read_heads/msim/waves/model_read_keys.do

  force -freeze sim:/model_read_heads_pkg/STIMULUS_ACCELERATOR_READ_KEYS_TEST true 0
  force -freeze sim:/model_read_heads_pkg/STIMULUS_ACCELERATOR_READ_KEYS_CASE_0 true 0

  onbreak {resume}
  run -all

  dataset save sim wlf/model_read_keys_test.wlf
}

##################################################################################################
# ACCELERATOR_READ_MODES_TEST 
##################################################################################################

alias model_read_modes_verification_compilation {
  echo "TEST: ACCELERATOR_READ_MODES_TEST"

  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/read_heads/model_read_heads_pkg.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/read_heads/model_read_heads_stimulus.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/read_heads/model_read_heads_testbench.vhd

  vsim -g /model_read_heads_testbench/ENABLE_ACCELERATOR_READ_MODES_TEST=true -t ps +notimingchecks -L unisim work.model_read_heads_testbench

  #MACROS
  add log -r sim:/model_read_heads_testbench/*

  #WAVES
  view -title model_read_modes wave
  do $simulation_path/model/dnc/read_heads/msim/waves/model_read_modes.do

  force -freeze sim:/model_read_heads_pkg/STIMULUS_ACCELERATOR_READ_MODES_TEST true 0
  force -freeze sim:/model_read_heads_pkg/STIMULUS_ACCELERATOR_READ_MODES_CASE_0 true 0

  onbreak {resume}
  run -all

  dataset save sim wlf/model_read_modes_test.wlf
}

##################################################################################################
# ACCELERATOR_READ_STRENGTHS_TEST 
##################################################################################################

alias model_read_strengths_verification_compilation {
  echo "TEST: ACCELERATOR_READ_STRENGTHS_TEST"

  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/read_heads/model_read_heads_pkg.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/read_heads/model_read_heads_stimulus.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/read_heads/model_read_heads_testbench.vhd

  vsim -g /model_read_heads_testbench/ENABLE_ACCELERATOR_READ_STRENGTHS_TEST=true -t ps +notimingchecks -L unisim work.model_read_heads_testbench

  #MACROS
  add log -r sim:/model_read_heads_testbench/*

  #WAVES
  view -title model_read_strengths wave
  do $simulation_path/model/dnc/read_heads/msim/waves/model_read_strengths.do

  force -freeze sim:/model_read_heads_pkg/STIMULUS_ACCELERATOR_READ_STRENGTHS_TEST true 0
  force -freeze sim:/model_read_heads_pkg/STIMULUS_ACCELERATOR_READ_STRENGTHS_CASE_0 true 0

  onbreak {resume}
  run -all

  dataset save sim wlf/model_read_strengths_test.wlf
}

##################################################################################################

alias v01 {
  model_free_gates_verification_compilation 
}

alias v02 {
  model_read_keys_verification_compilation 
}

alias v03 {
  model_read_modes_verification_compilation 
}

alias v04 {
  model_read_strengths_verification_compilation 
}

echo "****************************************"
echo "v01 . ACCELERATOR-FREE-GATES-TEST"
echo "v02 . ACCELERATOR-READ-KEYS-TEST"
echo "v03 . ACCELERATOR-READ-MODES-TEST"
echo "v04 . ACCELERATOR-READ-STRENGTHS-TEST"
echo "****************************************"