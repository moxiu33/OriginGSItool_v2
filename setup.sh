#!/bin/bash                                                                                                                                                                                                             if [[ "$OSTYPE" == "linux-gnu" ]]; then                                                                         distro=$(awk -F= '$1 == "ID" {print $2}' /etc/os-release)                                                   id_like=$(awk -F= '$1 == "ID_LIKE" {print $2}' /etc/os-release)                                             if [[ "$distro" == "arch" || "$id_like" == "arch" ]]; then                                                      echo "Arch Linux Detected"                                                                                  sudo pacman -S --needed unace unrar zip unzip p7zip sharutils uudeview arj cabextract file-roller d>    else                                                                                                            # Install required packages                                                                                 sudo apt update                                                                                             sudo apt install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cab>        # Install dtc if not already installed
        if ! command -v dtc &> /dev/null; then
            echo "Installing dtc from source..."
            sudo apt install -y build-essential flex bison
            git clone https://git.kernel.org/pub/scm/utils/dtc/dtc.git
            cd dtc
            make
            sudo make install
            cd ..
        fi
    fi
    # Create a virtual environment
    python3 -m venv venv
    # Activate the virtual environment
    source venv/bin/activate
    # Install Python packages in the virtual environment
    pip install backports.lzma protobuf pycrypto
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install protobuf xz brotli lz4 aria2
    # Create a virtual environment
    python3 -m venv venv
    # Activate the virtual environment
    source venv/bin/activate
    # Install Python packages in the virtual environment
    pip install backports.lzma protobuf pycrypto
fi
