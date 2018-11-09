# A33 quad core 1Gb SoC
BOARD_NAME="OLinuXino-A33"
BOARDFAMILY="sun8i"
OVERLAY_PREFIX="sun8i-a33"

MODULES="hci_uart gpio_sunxi rfcomm hidp bonding spi_sun7i 8021q a20_tp"
MODULES_NEXT="g_serial"
#
KERNEL_TARGET="default,next,dev"
CLI_TARGET="stretch,xenial:next"
DESKTOP_TARGET="xenial:default,next"
#
CLI_BETA_TARGET="stretch:next"
DESKTOP_BETA_TARGET="xenial:default"
#
RECOMMENDED="Ubuntu_xenial_default_desktop:90,Debian_jessie_next:100"
#
BOARDRATING=""
CHIP="http://docs.armbian.com/Hardware_Allwinner-A33/"
HARDWARE="https://www.olimex.com/Products/A33/"
FORUMS=""
