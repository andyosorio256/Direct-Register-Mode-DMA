# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/andy/Downloads/DMA/register-mode-dma/software/dma_host_system/_ide/scripts/systemdebugger_dma_host_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/andy/Downloads/DMA/register-mode-dma/software/dma_host_system/_ide/scripts/systemdebugger_dma_host_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351B3FED9A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351B3FED9A-13722093-0"}
fpga -file /home/andy/Downloads/DMA/register-mode-dma/software/dma_host/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/andy/Downloads/DMA/register-mode-dma/software/dma_platform/export/dma_platform/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/andy/Downloads/DMA/register-mode-dma/software/dma_host/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/andy/Downloads/DMA/register-mode-dma/software/dma_host/Debug/dma_host.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
