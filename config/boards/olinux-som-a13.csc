# A13 single core 512Mb SoM
BOARD_NAME="SoM A13"
BOARDFAMILY="sun5i"
BOOTCONFIG="A13-OLinuXinoM_defconfig"
MODULES="gpio_sunxi spi_sunxi"
MODULES_NEXT="bonding"
#
KERNEL_TARGET="next,dev"
CLI_TARGET="xenial:next"
DESKTOP_TARGET="xenial:next"
