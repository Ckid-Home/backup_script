[ "$(echo "${0%/*}" | grep -o 'bin.mt.plus/temp')" != "" ] && echo "你媽沒告訴你腳本要解壓縮嗎？傻逼玩兒" && exit 2
if [ -f "${0%/*}/tools/tools.sh" ]; then
    MODDIR="${0%/*}"
    operate="backup_media"
    conf_path="${0%/*}/backup_settings.conf"
    Update_backup=""
    [ ! -f "${0%/*}/backup_settings.conf" ] && . "${0%/*}/tools/tools.sh"
    case $(grep -o 'background_execution=.*' "$conf_path" | awk -F '=' '{print $2}') in
    0)
        . "${0%/*}/tools/tools.sh" | tee "${0%/*}/log.txt" ;;    
    1)
        {
        . "${0%/*}/tools/tools.sh" | tee "${0%/*}/log.txt"
        } & ;;
    esac
else
    echo "${0%/*}/tools/tools.sh遺失"
fi
