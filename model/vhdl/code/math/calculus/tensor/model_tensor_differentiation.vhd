--------------------------------------------------------------------------------
--                                            __ _      _     _               --
--                                           / _(_)    | |   | |              --
--                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |              --
--               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |              --
--              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |              --
--               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|              --
--                  | |                                                       --
--                  |_|                                                       --
--                                                                            --
--                                                                            --
--              Peripheral-NTM for MPSoC                                      --
--              Neural Turing Machine for MPSoC                               --
--                                                                            --
--------------------------------------------------------------------------------

-- Copyright (c) 2020-2021 by the author(s)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
--
--------------------------------------------------------------------------------
-- Author(s):
--   Paco Reina Campo <pacoreinacampo@queenfield.tech>

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.model_arithmetic_vhdl_pkg.all;
use work.model_math_vhdl_pkg.all;

entity model_tensor_differentiation is
  generic (
    DATA_SIZE    : integer := 64;
    CONTROL_SIZE : integer := 4
    );
  port (
    -- GLOBAL
    CLK : in std_logic;
    RST : in std_logic;

    -- CONTROL
    START : in  std_logic;
    READY : out std_logic;

    CONTROL : in std_logic_vector(1 downto 0);

    DATA_IN_I_ENABLE : in std_logic;
    DATA_IN_J_ENABLE : in std_logic;
    DATA_IN_K_ENABLE : in std_logic;

    DATA_I_ENABLE : out std_logic;
    DATA_J_ENABLE : out std_logic;
    DATA_K_ENABLE : out std_logic;

    DATA_OUT_I_ENABLE : out std_logic;
    DATA_OUT_J_ENABLE : out std_logic;
    DATA_OUT_K_ENABLE : out std_logic;

    -- DATA
    SIZE_I_IN   : in  std_logic_vector(CONTROL_SIZE-1 downto 0);
    SIZE_J_IN   : in  std_logic_vector(CONTROL_SIZE-1 downto 0);
    SIZE_K_IN   : in  std_logic_vector(CONTROL_SIZE-1 downto 0);
    LENGTH_I_IN : in  std_logic_vector(DATA_SIZE-1 downto 0);
    LENGTH_J_IN : in  std_logic_vector(DATA_SIZE-1 downto 0);
    LENGTH_K_IN : in  std_logic_vector(DATA_SIZE-1 downto 0);
    DATA_IN     : in  std_logic_vector(DATA_SIZE-1 downto 0);
    DATA_OUT    : out std_logic_vector(DATA_SIZE-1 downto 0)
    );
end entity;

architecture model_tensor_differentiation_architecture of model_tensor_differentiation is

  ------------------------------------------------------------------------------
  -- Types
  ------------------------------------------------------------------------------

  -- Finite State Machine
  type differentiation_ctrl_fsm is (
    STARTER_STATE,                      -- STEP 0
    INPUT_I_STATE,                      -- STEP 1
    INPUT_J_STATE,                      -- STEP 2
    INPUT_K_STATE,                      -- STEP 3
    ENDER_I_STATE,                      -- STEP 4
    ENDER_J_STATE,                      -- STEP 5
    ENDER_K_STATE,                      -- STEP 6
    CLEAN_I_STATE,                      -- STEP 7
    CLEAN_J_STATE,                      -- STEP 8
    CLEAN_K_STATE,                      -- STEP 9
    OPERATION_I_STATE,                  -- STEP 10
    OPERATION_J_STATE,                  -- STEP 11
    OPERATION_K_STATE                   -- STEP 12
    );

  ------------------------------------------------------------------------------
  -- Constants
  ------------------------------------------------------------------------------

  ------------------------------------------------------------------------------
  -- Signals
  ------------------------------------------------------------------------------

  -- Finite State Machine
  signal differentiation_ctrl_fsm_int : differentiation_ctrl_fsm;

  -- Buffer
  signal tensor_in_int : tensor_buffer;

  signal tensor_out_int : tensor_buffer;

  -- Control Internal
  signal index_i_loop : std_logic_vector(CONTROL_SIZE-1 downto 0);
  signal index_j_loop : std_logic_vector(CONTROL_SIZE-1 downto 0);
  signal index_k_loop : std_logic_vector(CONTROL_SIZE-1 downto 0);

begin

  ------------------------------------------------------------------------------
  -- Body
  ------------------------------------------------------------------------------

  -- DATA_OUT = differentiation(DATA_IN)

  -- CONTROL
  ctrl_fsm : process(CLK, RST)
  begin
    if (RST = '0') then
      -- Data Outputs
      DATA_OUT <= ZERO_DATA;

      -- Control Outputs
      READY <= '0';

      DATA_I_ENABLE <= '0';
      DATA_J_ENABLE <= '0';
      DATA_K_ENABLE <= '0';

      DATA_OUT_I_ENABLE <= '0';
      DATA_OUT_J_ENABLE <= '0';
      DATA_OUT_K_ENABLE <= '0';

      -- Control Internal
      index_i_loop <= ZERO_CONTROL;
      index_j_loop <= ZERO_CONTROL;
      index_k_loop <= ZERO_CONTROL;

    elsif (rising_edge(CLK)) then

      case differentiation_ctrl_fsm_int is
        when STARTER_STATE =>           -- STEP 0
          -- Control Outputs
          READY <= '0';

          DATA_OUT_I_ENABLE <= '0';
          DATA_OUT_J_ENABLE <= '0';
          DATA_OUT_K_ENABLE <= '0';

          if (START = '1') then
            -- Control Outputs
            DATA_I_ENABLE <= '1';
            DATA_J_ENABLE <= '1';
            DATA_K_ENABLE <= '1';

            -- Control Internal
            index_i_loop <= ZERO_CONTROL;
            index_j_loop <= ZERO_CONTROL;
            index_k_loop <= ZERO_CONTROL;

            -- FSM Control
            differentiation_ctrl_fsm_int <= INPUT_I_STATE;
          else
            -- Control Outputs
            DATA_I_ENABLE <= '0';
            DATA_J_ENABLE <= '0';
            DATA_K_ENABLE <= '0';
          end if;

        when INPUT_I_STATE =>           -- STEP 1

          if ((DATA_IN_I_ENABLE = '1') and (DATA_IN_J_ENABLE = '1') and (DATA_IN_K_ENABLE = '1')) then
            -- Data Inputs
            tensor_in_int(to_integer(unsigned(index_i_loop)), to_integer(unsigned(index_j_loop)), to_integer(unsigned(index_k_loop))) <= DATA_IN;

            -- FSM Control
            differentiation_ctrl_fsm_int <= ENDER_K_STATE;
          end if;

          -- Control Outputs
          DATA_I_ENABLE <= '0';
          DATA_J_ENABLE <= '0';
          DATA_K_ENABLE <= '0';

        when INPUT_J_STATE =>           -- STEP 2

          if ((DATA_IN_J_ENABLE = '1') and (DATA_IN_K_ENABLE = '1')) then
            -- Data Inputs
            tensor_in_int(to_integer(unsigned(index_i_loop)), to_integer(unsigned(index_j_loop)), to_integer(unsigned(index_k_loop))) <= DATA_IN;

            -- FSM Control
            if (unsigned(index_k_loop) = unsigned(SIZE_K_IN)-unsigned(ONE_CONTROL)) then
              differentiation_ctrl_fsm_int <= ENDER_J_STATE;
            else
              differentiation_ctrl_fsm_int <= ENDER_K_STATE;
            end if;
          end if;

          -- Control Outputs
          DATA_I_ENABLE <= '0';
          DATA_J_ENABLE <= '0';
          DATA_K_ENABLE <= '0';

        when INPUT_K_STATE =>           -- STEP 3

          if (DATA_IN_K_ENABLE = '1') then
            -- Data Inputs
            tensor_in_int(to_integer(unsigned(index_i_loop)), to_integer(unsigned(index_j_loop)), to_integer(unsigned(index_k_loop))) <= DATA_IN;

            -- FSM Control
            if ((unsigned(index_j_loop) = unsigned(SIZE_J_IN)-unsigned(ONE_CONTROL)) and (unsigned(index_k_loop) = unsigned(SIZE_K_IN)-unsigned(ONE_CONTROL))) then
              differentiation_ctrl_fsm_int <= ENDER_I_STATE;
            elsif (unsigned(index_k_loop) = unsigned(SIZE_K_IN)-unsigned(ONE_CONTROL)) then
              differentiation_ctrl_fsm_int <= ENDER_J_STATE;
            else
              differentiation_ctrl_fsm_int <= ENDER_K_STATE;
            end if;
          end if;

          -- Control Outputs
          DATA_I_ENABLE <= '0';
          DATA_J_ENABLE <= '0';
          DATA_K_ENABLE <= '0';

        when ENDER_I_STATE =>           -- STEP 4

          if ((unsigned(index_i_loop) = unsigned(SIZE_I_IN)-unsigned(ONE_CONTROL)) and (unsigned(index_j_loop) = unsigned(SIZE_J_IN)-unsigned(ONE_CONTROL)) and (unsigned(index_k_loop) = unsigned(SIZE_K_IN)-unsigned(ONE_CONTROL))) then
            -- Control Internal
            index_i_loop <= ZERO_CONTROL;
            index_j_loop <= ZERO_CONTROL;
            index_k_loop <= ZERO_CONTROL;

            -- Data Internal
            tensor_out_int <= function_tensor_differentiation (
              CONTROL => CONTROL,

              SIZE_I_IN => SIZE_I_IN,
              SIZE_J_IN => SIZE_J_IN,
              SIZE_K_IN => SIZE_K_IN,

              LENGTH_I_IN => LENGTH_I_IN,
              LENGTH_J_IN => LENGTH_J_IN,
              LENGTH_K_IN => LENGTH_K_IN,

              tensor_input => tensor_in_int
              );

            -- FSM Control
            differentiation_ctrl_fsm_int <= CLEAN_I_STATE;
          elsif ((unsigned(index_i_loop) < unsigned(SIZE_I_IN)-unsigned(ONE_CONTROL)) and (unsigned(index_j_loop) = unsigned(SIZE_J_IN)-unsigned(ONE_CONTROL)) and (unsigned(index_k_loop) = unsigned(SIZE_K_IN)-unsigned(ONE_CONTROL))) then
            -- Control Outputs
            DATA_I_ENABLE <= '1';
            DATA_J_ENABLE <= '1';
            DATA_K_ENABLE <= '1';

            -- Control Internal
            index_i_loop <= std_logic_vector(unsigned(index_i_loop)+unsigned(ONE_CONTROL));
            index_j_loop <= ZERO_CONTROL;
            index_k_loop <= ZERO_CONTROL;

            -- FSM Control
            differentiation_ctrl_fsm_int <= INPUT_I_STATE;
          end if;

        when ENDER_J_STATE =>           -- STEP 5

          if ((unsigned(index_j_loop) < unsigned(SIZE_J_IN)-unsigned(ONE_CONTROL)) and (unsigned(index_k_loop) = unsigned(SIZE_K_IN)-unsigned(ONE_CONTROL))) then
            -- Control Outputs
            DATA_J_ENABLE <= '1';
            DATA_K_ENABLE <= '1';

            -- Control Internal
            index_j_loop <= std_logic_vector(unsigned(index_j_loop)+unsigned(ONE_CONTROL));
            index_k_loop <= ZERO_CONTROL;

            -- FSM Control
            differentiation_ctrl_fsm_int <= INPUT_J_STATE;
          end if;

        when ENDER_K_STATE =>           -- STEP 6

          if (unsigned(index_k_loop) < unsigned(SIZE_K_IN)-unsigned(ONE_CONTROL)) then
            -- Control Outputs
            DATA_K_ENABLE <= '1';

            -- Control Internal
            index_k_loop <= std_logic_vector(unsigned(index_k_loop)+unsigned(ONE_CONTROL));

            -- FSM Control
            differentiation_ctrl_fsm_int <= INPUT_K_STATE;
          end if;

        when CLEAN_I_STATE =>           -- STEP 7

          -- Control Outputs
          DATA_I_ENABLE <= '0';
          DATA_J_ENABLE <= '0';
          DATA_K_ENABLE <= '0';

          DATA_OUT_I_ENABLE <= '0';
          DATA_OUT_J_ENABLE <= '0';
          DATA_OUT_K_ENABLE <= '0';

          -- FSM Control
          differentiation_ctrl_fsm_int <= OPERATION_K_STATE;

        when CLEAN_J_STATE =>           -- STEP 8

          -- Control Outputs
          DATA_I_ENABLE <= '0';
          DATA_J_ENABLE <= '0';
          DATA_K_ENABLE <= '0';

          DATA_OUT_I_ENABLE <= '0';
          DATA_OUT_J_ENABLE <= '0';
          DATA_OUT_K_ENABLE <= '0';

          -- FSM Control
          if (unsigned(index_k_loop) = unsigned(SIZE_K_IN)-unsigned(ONE_CONTROL)) then
            differentiation_ctrl_fsm_int <= OPERATION_J_STATE;
          else
            differentiation_ctrl_fsm_int <= OPERATION_K_STATE;
          end if;

        when CLEAN_K_STATE =>           -- STEP 9

          -- Control Outputs
          DATA_I_ENABLE <= '0';
          DATA_J_ENABLE <= '0';
          DATA_K_ENABLE <= '0';

          DATA_OUT_I_ENABLE <= '0';
          DATA_OUT_J_ENABLE <= '0';
          DATA_OUT_K_ENABLE <= '0';

          -- FSM Control
          if ((unsigned(index_j_loop) = unsigned(SIZE_J_IN)-unsigned(ONE_CONTROL)) and (unsigned(index_k_loop) = unsigned(SIZE_K_IN)-unsigned(ONE_CONTROL))) then
            differentiation_ctrl_fsm_int <= OPERATION_I_STATE;
          elsif (unsigned(index_k_loop) = unsigned(SIZE_K_IN)-unsigned(ONE_CONTROL)) then
            differentiation_ctrl_fsm_int <= OPERATION_J_STATE;
          else
            differentiation_ctrl_fsm_int <= OPERATION_K_STATE;
          end if;

        when OPERATION_I_STATE =>       -- STEP 10

          if ((unsigned(index_i_loop) = unsigned(SIZE_I_IN)-unsigned(ONE_CONTROL)) and (unsigned(index_j_loop) = unsigned(SIZE_J_IN)-unsigned(ONE_CONTROL)) and (unsigned(index_k_loop) = unsigned(SIZE_K_IN)-unsigned(ONE_CONTROL))) then
            -- Data Outputs
            DATA_OUT <= tensor_out_int(to_integer(unsigned(index_i_loop)), to_integer(unsigned(index_k_loop)), to_integer(unsigned(index_j_loop)));

            -- Control Outputs
            READY <= '1';

            DATA_OUT_I_ENABLE <= '1';
            DATA_OUT_J_ENABLE <= '1';
            DATA_OUT_K_ENABLE <= '1';

            -- Control Internal
            index_i_loop <= ZERO_CONTROL;
            index_j_loop <= ZERO_CONTROL;
            index_k_loop <= ZERO_CONTROL;

            -- FSM Control
            differentiation_ctrl_fsm_int <= STARTER_STATE;
          elsif ((unsigned(index_i_loop) < unsigned(SIZE_I_IN)-unsigned(ONE_CONTROL)) and (unsigned(index_j_loop) = unsigned(SIZE_J_IN)-unsigned(ONE_CONTROL)) and (unsigned(index_k_loop) = unsigned(SIZE_K_IN)-unsigned(ONE_CONTROL))) then
            -- Data Outputs
            DATA_OUT <= tensor_out_int(to_integer(unsigned(index_i_loop)), to_integer(unsigned(index_k_loop)), to_integer(unsigned(index_j_loop)));

            -- Control Outputs
            DATA_OUT_I_ENABLE <= '1';
            DATA_OUT_J_ENABLE <= '1';
            DATA_OUT_K_ENABLE <= '1';

            -- Control Internal
            index_i_loop <= std_logic_vector(unsigned(index_i_loop)+unsigned(ONE_CONTROL));
            index_j_loop <= ZERO_CONTROL;
            index_k_loop <= ZERO_CONTROL;

            -- FSM Control
            differentiation_ctrl_fsm_int <= CLEAN_I_STATE;
          end if;

        when OPERATION_J_STATE =>       -- STEP 11

          if ((unsigned(index_j_loop) < unsigned(SIZE_J_IN)-unsigned(ONE_CONTROL)) and (unsigned(index_k_loop) = unsigned(SIZE_K_IN)-unsigned(ONE_CONTROL))) then
            -- Data Outputs
            DATA_OUT <= tensor_out_int(to_integer(unsigned(index_i_loop)), to_integer(unsigned(index_k_loop)), to_integer(unsigned(index_j_loop)));

            -- Control Outputs
            DATA_OUT_J_ENABLE <= '1';
            DATA_OUT_K_ENABLE <= '1';

            -- Control Internal
            index_j_loop <= std_logic_vector(unsigned(index_j_loop)+unsigned(ONE_CONTROL));
            index_k_loop <= ZERO_CONTROL;

            -- FSM Control
            differentiation_ctrl_fsm_int <= CLEAN_J_STATE;
          end if;

        when OPERATION_K_STATE =>       -- STEP 12

          if (unsigned(index_k_loop) < unsigned(SIZE_K_IN)-unsigned(ONE_CONTROL)) then
            -- Data Outputs
            DATA_OUT <= tensor_out_int(to_integer(unsigned(index_i_loop)), to_integer(unsigned(index_k_loop)), to_integer(unsigned(index_j_loop)));

            -- Control Outputs
            DATA_OUT_K_ENABLE <= '1';

            -- Control Internal
            index_k_loop <= std_logic_vector(unsigned(index_k_loop)+unsigned(ONE_CONTROL));

            -- FSM Control
            differentiation_ctrl_fsm_int <= CLEAN_K_STATE;
          end if;

        when others =>
          -- FSM Control
          differentiation_ctrl_fsm_int <= STARTER_STATE;
      end case;
    end if;
  end process;

end architecture;
