# Common configuration file for all A20-OLinuXino boards
BOARD_NAME="OLinuXino-A20"
BOARDFAMILY="olinuxino"

MODULES="8021q a20_tp bonding ft5x_ts g_serial gpio_sunxi m25p80 spi_sun7i sunxi_lirc_new sunxi_can"
MODULES_NEXT="bonding g_serial gpio-ir-tx r8723bs"
MODULES_DEV="bonding g_serial gpio-ir-tx r8723bs "
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
CHIP="http://docs.armbian.com/Hardware_Allwinner-A20/"
HARDWARE="https://www.olimex.com/Products/SOM204/"
FORUMS="http://forum.armbian.com/index.php/forum/7-allwinner-a10a20/"
