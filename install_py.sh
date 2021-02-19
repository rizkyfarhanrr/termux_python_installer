echo """
#==========================#
#  Python 3.8.6 Installer  #
#  Telegram @rzhanrr       #
#==========================#
"""



vers=`uname -m`
DIRECTORY_PATH="rzhan_python_installer"
mkdir -p $DIRECTORY_PATH

startup () {
    termux-setup-storage
    pkg update && pkg upgrade
    apt install curl
    check_python
}
check_python () {
    pyv="$(python -V 2>&1)"
    echo "Checking python version Please Wait....."
    echo " "
    sleep 2
    if ! command -v python &> /dev/null
    then
        printf "python is not available \nwant to install python 3.8.6 ?\n"
        echo " "
        while true
        do
         read -r -p "Yes or No? [Y/n] " input

         case $input in
             [yY][eE][sS]|[yY])
         download_install
         break
         ;;
             [nN][oO]|[nN])
         echo " "
         echo "Ok Exiting program ... "
         sleep 2
         exit
                ;;
             *)
         echo " "
         echo "you can only choose [Y]es or [N]o"
         ;;
         esac
        done
    else
        printf "your python is available as $pyv --version \nwant to reinstall with 3.8.6 --version?\n"
        echo " "
        while true
        do
         read -r -p "Yes or No [Y/n] " input

         case $input in
             [yY][eE][sS]|[yY])
         pkg uninstall python -y
         download_install
         break
         ;;
             [nN][oO]|[nN])
         echo " "
         echo "Ok Exiting program ... "
         sleep 2
         exit
                ;;
             *)
         echo " "
         echo "you can only choose [Y]es or [N]o"
         ;;
         esac
        done
    fi
}

download_install (){

    curl -o $DIRECTORY_PATH/python_static.deb https://raw.githubusercontent.com/Termux-pod/termux-pod/main/$vers/python/python-3.8.6/python-static_3.8.6_aarch64.deb
    curl -o $DIRECTORY_PATH/python_tkinter.deb https://raw.githubusercontent.com/Termux-pod/termux-pod/main/$vers/python/python-3.8.6/python-tkinter_3.8.6_aarch64.deb
    curl -o $DIRECTORY_PATH/python_3.8.6.deb https://raw.githubusercontent.com/Termux-pod/termux-pod/main/$vers/python/python-3.8.6/python_3.8.6_aarch64.deb

    for d in $(ls $DIRECTORY_PATH); do apt install $DIRECTORY_PATH/./$d ; echo "$d Succesfully Installed"; done
    
    rm -r $DIRECTORY_PATH
    echo "installation file has been deleted"
}

startup