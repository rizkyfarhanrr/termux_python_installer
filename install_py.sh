yon() { 
    while true; do 
        echo "Start proc?[Y/n]: "
        read -r "[Y/n]: " yn 
        case $yn in 
            [Yy]*) echo "Starting"; return 0 ;;
            [Nn]*) echo "Stopped"; return 1 ;; 
        esac 
    done
}
yon
