onerror {resume}

quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {=========================================}
add wave -noupdate -divider {NTM CONVOLUTIONAL FNN TEST}
add wave -noupdate -divider {=========================================}

add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/CLK
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/RST

add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/START

add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/SIZE_X_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/SIZE_W_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/SIZE_L_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/SIZE_R_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/SIZE_S_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/SIZE_M_IN

add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/W_IN_L_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/W_IN_X_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/W_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/W_OUT_L_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/W_OUT_X_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/D_IN_I_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/D_IN_L_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/D_IN_M_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/D_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/D_OUT_I_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/D_OUT_L_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/D_OUT_M_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/K_IN_I_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/K_IN_L_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/K_IN_K_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/K_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/K_OUT_I_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/K_OUT_L_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/K_OUT_K_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/U_IN_L_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/U_IN_P_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/U_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/U_OUT_L_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/U_OUT_P_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/V_IN_L_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/V_IN_S_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/V_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/V_OUT_L_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/V_OUT_S_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/B_IN_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/B_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/B_OUT_ENABLE

add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/X_IN_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/X_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/X_OUT_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/R_IN_I_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/R_IN_K_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/R_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/R_OUT_I_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/R_OUT_K_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/RHO_IN_I_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/RHO_IN_M_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/RHO_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/RHO_OUT_I_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/RHO_OUT_M_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/XI_IN_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/XI_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/XI_OUT_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/H_IN_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/H_IN
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/H_OUT_ENABLE

add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/READY
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/H_ENABLE
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/H_OUT

add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/controller_h_out_fsm_int
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/index_l_h_out_loop

add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/data_w_in_enable_int
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/data_k_in_enable_int
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/data_u_in_enable_int
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/data_v_in_enable_int
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/data_d_in_enable_int
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/data_b_in_enable_int

add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/data_x_in_enable_int
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/data_r_in_enable_int
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/data_xi_in_enable_int
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/data_rho_in_enable_int
add wave -noupdate /model_convolutional_fnn_testbench/model_convolutional_fnn_test/controller/data_h_in_enable_int

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1042309203 ps} 0} {{Cursor 2} {7446987402 ps} 0}
configure wave -namecolwidth 305
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {1134027470 ps} {1150214364 ps}
