# Common configuration file for all A20-OLinuXino boards
BOARD_NAME="OLinuXino-A20"
BOARDFAMILY="sun7i"

MODULES="8021q a20_tp bonding ft5x_ts g_serial gpio_sunxi m25p80 spi_sun7i sunxi_lirc_new sunxi_can"
MODULES_NEXT="bonding g_serial"
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
HARDWARE="https://www.olimex.com/Products/OLinuXino/A20/"
FORUMS="http://forum.armbian.com/index.php/forum/7-allwinner-a10a20/"

# Specific function for SPI flash write
write_uboot_platform_mtd()
{
	for mtd in ${spicheck[@]}; do

	local _name=$(mtdinfo /dev/$mtd | grep "Name: "| awk '{print $2}')
	local _i=0

	if [[ $_name == "SPI.u-boot-env"* ]]; then

		# Check for environment file
		if [[ ! -f /boot/uboot.env ]]; then
			flash_erase /dev/$mtd 0 0
			continue
		fi

		flashcp -v /boot/uboot.env /dev/$mtd | stdbuf -o0 tr '\r' '\n' \
		| while read line; do

			local _progress=$(echo "$line" | grep -o -P '[0-9]*(\.[0-9]*)?(?=%)')

			[[ $line == *"Erasing blocks"* ]] && _i=0
			[[ $line == *"Writing data"* ]] && _i=1
			[[ $line == *"Verifying data"* ]] && _i=2

			echo XXX
			echo $((($_i * 33) + (_progress / 3)))
			echo "\n\n  Installing uboot.env to \Z1$_name\Zn:"
			echo "\n\n  $line"
			echo XXX

		done \
		| dialog --colors --backtitle "$backtitle" --title " $title " --gauge "Installing uboot.env to $\Z1$_name\Zn" 11 80

	elif [[ $_name == "SPI.u-boot" ]]; then
		flashcp -v $1/u-boot-sunxi-with-spl.bin /dev/$mtd | stdbuf -o0 tr '\r' '\n' \
		| while read line; do

			local _progress=$(echo "$line" | grep -o -P '[0-9]*(\.[0-9]*)?(?=%)')

			[[ $line == *"Erasing blocks"* ]] && _i=0
			[[ $line == *"Writing data"* ]] && _i=1
			[[ $line == *"Verifying data"* ]] && _i=2

			echo XXX
			echo $((($_i * 33) + (_progress / 3)))
			echo "\n\n  Installing u-boot-sunxi-with-spl.bin to \Z1$_name\Zn:"
			echo "\n\n  $line"
			echo XXX

		done \
		| dialog --colors --backtitle "$backtitle" --title " $title " --gauge "Installing u-boot-sunxi-with-spl.bin to $\Z1$_name\Zn" 11 80
	fi
done
}
