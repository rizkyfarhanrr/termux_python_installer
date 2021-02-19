echo """
#==========================#
#  Python 3.8.6 Installer  #
#  Telegram @rzhanrr       #
#==========================#
"""
vers=`uname -m`
DIRECTORY_PATH="python_installer"
mkdir -p $DIRECTORY_PATH

pkg update && pkg upgrade
pkg install curl

echo "Checking python version ....."
if ! command -v python &> /dev/null
then
    echo ""
    echo "python is not available"
    echo "installing python 3.8.6 ... "
    echo ""
    download_install()
    
else
    pyv="$(python -V 2>&1)"
    echo ""
    echo "your python is available as $pyv --version"
    echo "reinstall with 3.8.6 --version "
    echo ""
    pkg uninstall python -y
    download_install()
fi

download_install() {
    curl -o $DIRECTORY_PATH/python_static.deb https://raw.githubusercontent.com/Termux-pod/termux-pod/main/$vers/python/python-3.8.6/python-static_3.8.6_aarch64.deb
    curl -o $DIRECTORY_PATH/python_tkinter.deb https://raw.githubusercontent.com/Termux-pod/termux-pod/main/$vers/python/python-3.8.6/python-tkinter_3.8.6_aarch64.deb
    curl -o $DIRECTORY_PATH/python_3.8.6.deb https://raw.githubusercontent.com/Termux-pod/termux-pod/main/$vers/python/python-3.8.6/python_3.8.6_aarch64.deb
    for d in $(ls $DIRECTORY_PATH); do apt install $DIRECTORY_PATH/./$d ; echo "$d Succesfully Installed"; done

    rm -r $DIRECTORY_PATH

    echo "installation file has been deleted"
}
