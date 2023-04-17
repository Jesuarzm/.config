# set some colors
CNT="[\e[1;36mNOTE\e[0m]"
COK="[\e[1;32mOK\e[0m]"
CER="[\e[1;31mERROR\e[0m]"
CAT="[\e[1;37mATTENTION\e[0m]"
CWR="[\e[1;35mWARNING\e[0m]"
CAC="[\e[1;33mACTION\e[0m]"
INSTLOG="install.log"

ISYAY=/sbin/yay
if [ -f "$ISYAY" ]; then 
    echo -e "$COK - Yay encontrado."
else 
    echo -e "$CWR - Yay no encontrado"
    read -n1 -rep $'[\e[1;33mACTION\e[0m] - Instalar Yay? (y,n) ' INSTYAY
    if [[ $INSTYAY == "Y" || $INSTYAY == "y" ]]; then
        git clone https://aur.archlinux.org/yay-git.git &>> $INSTLOG
        cd yay-git
        makepkg -si --noconfirm &>> ../$INSTLOG
        cd ..
        
    else
        echo -e "$CER - Yay es requerido para este script, adios!"
        exit
    fi
fi

### Install all of the above pacakges ####
read -n1 -rep $'[\e[1;33mACTION\e[0m] - Proceder con la instalacion de paquetes? (y,n) ' INST
if [[ $INST == "Y" || $INST == "y" ]]; then
    # update the DB first
    echo -e "$COK - Acutalizando yay..."
    yay -Syyu --noconfirm &>> $INSTLOG
    
    #Stage 1
    echo -e "\n$CNT - Stage 1 - Instalando los componentes necesarios, esto puede tardar un poco..."
    for SOFTWR in whatsie bluemail libreoffice-fresh-es spicetify-cli spotify-adblock bibata-cursor-theme google-chrome teams catppuccin-gtk-theme-mocha kora-icon-theme 
    do
        #First lets see if the package is there
        if yay -Qs $SOFTWR > /dev/null ; then
            echo -e "$COK - $SOFTWR ya esta instalado."
        else
            echo -e "$CNT - Instalando $SOFTWR ..."
            yay -S --noconfirm $SOFTWR &>> $INSTLOG
            if yay -Qs $SOFTWR > /dev/null ; then
                echo -e "$COK - $SOFTWR inslatado correctamente."
            else
                echo -e "$CER - $SOFTWR fallo en instalacion, revisar install.log"
                exit
            fi
        fi
    done

sleep 3

echo -e "$CNT - Actualizando sistema..."
sudo pacman -Syyu --noconfirm &>> $INSTLOG

for SOFTWRP in git plank redshift kitty linux-headers lightdm-webkit2-greeter lightdm-webkit-theme-litarvan atril xed cinnamon cinnamon-translations wmctrl gcc make rofi gnome-disk-utility gnome-calculator gnome-screenshot nano ffmpegthumbnailer
do
#First lets see if the package is there
if pacman -Qs $SOFTWRP > /dev/null ; then
    echo -e "$COK - $SOFTWRP ya esta instalado."
else
    echo -e "$CNT - Instalando $SOFTWR ..."
    sudo pacman -S --noconfirm $SOFTWRP &>> $INSTLOG
    if pacman -Qs $SOFTWRP > /dev/null ; then
        echo -e "$COK - $SOFTWRP inslatado correctamente."
    else
        echo -e "$CER - $SOFTWRP fallo en instalacion, revisar install.log"
        exit
    fi
fi
done

### Script is done ###
echo -e "$CNT - Script had completed!"
read -n1 -rep $'[\e[1;33mACTION\e[0m] - Would you like to start Hyprland now? (y,n) ' HYP
if [[ $HYP == "Y" || $HYP == "y" ]]; then
    exec sudo systemctl start sddm &>> $INSTLOG
else
    exit
fi