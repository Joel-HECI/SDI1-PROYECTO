bghdl -i ./State\ Machines/potencia.vhd ./Test/testbench-potencia.vhd && ghdl -m testbench && ghdl -r testbench --vcd=./Dumps/potencia-dump.vcd

ghdl -i ./Contadores/cont_des.vhd ./Test/testbench-cont.vhd && ghdl -m testbench && ghdl -r testbench --vcd=./Dumps/cont-dump.vcd

ghdl -i ./Contadores/cont_0a9.vhd ./Test/testbench-cont09.vhd && ghdl -m testbench && ghdl -r testbench --vcd=./Dumps/cont09-dump.vcd

ghdl -i ./FLIP-FLOP_D.vhd ./SR_SP.vhd ./Test/testbench-sr.vhd && ghdl -m testbench && ghdl -r testbench --vcd=./Dumps/sr-dump.vcd

ghdl -i ./State\ Machines/global.vhd ./Test/testbench-global.vhd && ghdl -m testbench && ghdl -r testbench --vcd=./Dumps/global-dump.vcd

ghdl -i ./State\ Machines/global.vhd ./State\ Machines/potencia.vhd ./Contadores/cont_des.vhd ./Contadores/cont_0a9.vhd mux4a2.vhd SR_SP.vhd enable.vhd mainT.vhd ./Test/testbench-main.vhd && ghdl -m testbench && ghdl -r testbench --vcd=./Dumps/main-dump.vcd