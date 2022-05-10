# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/andy/Downloads/DMA/register-mode-dma/software/dma_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/andy/Downloads/DMA/register-mode-dma/software/dma_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {dma_platform}\
-hw {/home/andy/Downloads/DMA/register-mode-dma/trafficgen_dma/design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {/home/andy/Downloads/DMA/register-mode-dma/software}

platform write
platform generate -domains 
platform active {dma_platform}
platform generate
platform active {dma_platform}
platform generate -domains 
platform active {dma_platform}
platform generate -domains 
