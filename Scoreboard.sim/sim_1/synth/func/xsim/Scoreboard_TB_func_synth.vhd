-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Tue Apr 30 21:03:17 2024
-- Host        : Desktop-2024-02 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               D:/Users/marco/vivado/Scoreboard/Scoreboard.sim/sim_1/synth/func/xsim/Scoreboard_TB_func_synth.vhd
-- Design      : Debouncer
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s50csga324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Debouncer is
  port (
    clk : in STD_LOGIC;
    input_signal : in STD_LOGIC;
    debounced_signal : out STD_LOGIC;
    reg_out : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Debouncer : entity is true;
  attribute clock_period : string;
  attribute clock_period of Debouncer : entity is "64'b0000000000000000000000000000000000000000100110001001011010000000";
  attribute reg_width : integer;
  attribute reg_width of Debouncer : entity is 16;
end Debouncer;

architecture STRUCTURE of Debouncer is
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal debounced_signal_OBUF : STD_LOGIC;
  signal debounced_signal_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal debounced_signal_OBUF_inst_i_3_n_0 : STD_LOGIC;
  signal input_signal_IBUF : STD_LOGIC;
  signal reg_out_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
\debounce_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => reg_out_OBUF(1),
      Q => reg_out_OBUF(0),
      R => '0'
    );
\debounce_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => reg_out_OBUF(11),
      Q => reg_out_OBUF(10),
      R => '0'
    );
\debounce_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => reg_out_OBUF(12),
      Q => reg_out_OBUF(11),
      R => '0'
    );
\debounce_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => reg_out_OBUF(13),
      Q => reg_out_OBUF(12),
      R => '0'
    );
\debounce_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => reg_out_OBUF(14),
      Q => reg_out_OBUF(13),
      R => '0'
    );
\debounce_reg_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => reg_out_OBUF(15),
      Q => reg_out_OBUF(14),
      R => '0'
    );
\debounce_reg_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => input_signal_IBUF,
      Q => reg_out_OBUF(15),
      R => '0'
    );
\debounce_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => reg_out_OBUF(2),
      Q => reg_out_OBUF(1),
      R => '0'
    );
\debounce_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => reg_out_OBUF(3),
      Q => reg_out_OBUF(2),
      R => '0'
    );
\debounce_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => reg_out_OBUF(4),
      Q => reg_out_OBUF(3),
      R => '0'
    );
\debounce_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => reg_out_OBUF(5),
      Q => reg_out_OBUF(4),
      R => '0'
    );
\debounce_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => reg_out_OBUF(6),
      Q => reg_out_OBUF(5),
      R => '0'
    );
\debounce_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => reg_out_OBUF(7),
      Q => reg_out_OBUF(6),
      R => '0'
    );
\debounce_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => reg_out_OBUF(8),
      Q => reg_out_OBUF(7),
      R => '0'
    );
\debounce_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => reg_out_OBUF(9),
      Q => reg_out_OBUF(8),
      R => '0'
    );
\debounce_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => reg_out_OBUF(10),
      Q => reg_out_OBUF(9),
      R => '0'
    );
debounced_signal_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => debounced_signal_OBUF,
      O => debounced_signal
    );
debounced_signal_OBUF_inst_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => debounced_signal_OBUF_inst_i_2_n_0,
      I1 => reg_out_OBUF(1),
      I2 => reg_out_OBUF(0),
      I3 => reg_out_OBUF(3),
      I4 => reg_out_OBUF(2),
      I5 => debounced_signal_OBUF_inst_i_3_n_0,
      O => debounced_signal_OBUF
    );
debounced_signal_OBUF_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => reg_out_OBUF(12),
      I1 => reg_out_OBUF(13),
      I2 => reg_out_OBUF(10),
      I3 => reg_out_OBUF(11),
      I4 => reg_out_OBUF(15),
      I5 => reg_out_OBUF(14),
      O => debounced_signal_OBUF_inst_i_2_n_0
    );
debounced_signal_OBUF_inst_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => reg_out_OBUF(6),
      I1 => reg_out_OBUF(7),
      I2 => reg_out_OBUF(4),
      I3 => reg_out_OBUF(5),
      I4 => reg_out_OBUF(9),
      I5 => reg_out_OBUF(8),
      O => debounced_signal_OBUF_inst_i_3_n_0
    );
input_signal_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => input_signal,
      O => input_signal_IBUF
    );
\reg_out_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(0),
      O => reg_out(0)
    );
\reg_out_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(10),
      O => reg_out(10)
    );
\reg_out_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(11),
      O => reg_out(11)
    );
\reg_out_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(12),
      O => reg_out(12)
    );
\reg_out_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(13),
      O => reg_out(13)
    );
\reg_out_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(14),
      O => reg_out(14)
    );
\reg_out_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(15),
      O => reg_out(15)
    );
\reg_out_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(1),
      O => reg_out(1)
    );
\reg_out_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(2),
      O => reg_out(2)
    );
\reg_out_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(3),
      O => reg_out(3)
    );
\reg_out_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(4),
      O => reg_out(4)
    );
\reg_out_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(5),
      O => reg_out(5)
    );
\reg_out_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(6),
      O => reg_out(6)
    );
\reg_out_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(7),
      O => reg_out(7)
    );
\reg_out_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(8),
      O => reg_out(8)
    );
\reg_out_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => reg_out_OBUF(9),
      O => reg_out(9)
    );
end STRUCTURE;
