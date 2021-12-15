#!/bin/bash
# Default acpi script that takes an entry for all actions

case "$1" in
	video/brightnessdown)
		light -U 5
		;;
	video/brightnessup)
		light -A 5
		;;
	button/volumedown)
		sudo -u igor XDG_RUNTIME_DIR=/run/user/1000 pactl set-sink-volume @DEFAULT_SINK@ -10%
		;;
	button/volumeup)
		sudo -u igor XDG_RUNTIME_DIR=/run/user/1000 pactl set-sink-volume @DEFAULT_SINK@ +10%
		;;
	button/mute)
		sudo -u igor XDG_RUNTIME_DIR=/run/user/1000 pactl set-sink-mute @DEFAULT_SINK@ toggle
		;;
    button/power)
        case "$2" in
            PBTN|PWRF)
                logger 'PowerButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    button/sleep)
        case "$2" in
            SLPB|SBTN)
                logger 'SleepButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000)
                        logger 'AC unpluged'
                        dunstify "AC unpluged" 
                        ;;
                    00000001)
                        logger 'AC pluged'
                        dunstify "AC pluged" 
                        ;;
                esac
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    battery)
        case "$2" in
            BAT0)
                case "$4" in
                    00000000)
                        logger 'Battery online'
                        ;;
                    00000001)
                        logger 'Battery offline'
                        ;;
                esac
                ;;
            CPU0)
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;
    button/lid)
        case "$3" in
            close)
                logger 'LID closed'
                light -S 0
                ;;
            open)
                logger 'LID opened'
                light -S 1
                ;;
            *)
                logger "ACPI action undefined: $3"
                ;;
    esac
    ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac

# vim:set ts=4 sw=4 ft=sh et:
