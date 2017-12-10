
sudo apt install fbreader wget curl bison flex apvlv vim-nox vlc tmux git wine subversion python python3

# install of pip {
    sudo apt-get install python-pip
    pip install --upgrade pip
# }


# install of shadowsocks-qt5 {
    sudo add-apt-repository ppa:hzwhuang/ss-qt5
    sudo apt-get update
    sudo apt-get install shadowsocks-qt5

    # config ss qt5
    mkdir -p ~/.config/shadowsocks-qt5/
    cp ../cfg/ss-qt5-config.ini ~/.config/shadowsocks-qt5/

    # start ss
    ss-qt5 &

    # wait for config of ss
    # echo "please config ss and press anything to continue"
    # read l
# }

# install of http to socks proxy {
    sudo apt install privoxy
    sudo echo "forward-socks5 / 127.0.0.1:1280 ." >> /etc/privoxy/config
    sudo /etc/init.d/privoxy restart
    sudo echo "sudo /etc/init.d privoxy start" >>/etc/rc.local

    # config shell http proxy to privoxy
    echo 'export http_proxy="127.0.0.1:8118"' >> ~/.bashrc
    echo 'export https_proxy="127.0.0.1:8118"' >> ~/.bashrc
    source ~/.bashrc

    sudo echo 'export http_proxy="127.0.0.1:8118"' >> /etc/profile
    sudo echo 'export https_proxy="127.0.0.1:8118"' >> /etc/profile
# }
# install of http to genPAC {
    sudo pip install genpac
    pip install --upgrade genpac
    genpac -p "SOCKS5 127.0.0.1:1080" --gfwlist-proxy="SOCKS5 127.0.0.1:1080" --gfwlist-url=https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt --output="~/.autoproxy.pac"
    echo "please set system wide proxy to ~/.autoproxy.pac, and press anything to continue"
    read l
# }
# install of typora {
    # optional, but recommended
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
    # add Typora's repository
    sudo add-apt-repository 'deb http://typora.io linux/'
    sudo apt-get update
    # install typora
    sudo apt-get install typora
#}

# install of adobe reader enu {
    sudo apt-get install gtk2-engines-murrine:i386 libcanberra-gtk-module:i386 libatk-adaptor:i386 libgail-common:i386
    sudo add-apt-repository "deb http://archive.canonical.com/ precise partner"
    sudo apt-get update
    sudo apt-get install adobereader-enu
    sudo add-apt-repository -r "deb http://archive.canonical.com/ precise partner"
    sudo apt-get update
#}

# install of teamviewer {
    wget https://download.teamviewer.com/download/linux/teamviewer_i386.deb -O teamviewer.deb
    if [ $? -eq 0 ]; then
        sudo apt install ./teamviewer.deb
    else
        echo "teamview install fail"
    fi
#}

# install of atom 32bit {
    # atom supply only 64-bit in website, so we must use the following ins. to install 32 bit atom
    sudo add-apt-repository ppa:webupd8team/atom
    sudo apt update; sudo apt install atom
    # to remove atom:
    # sudo apt remove --purge atom
#}

# install of sublime {
    # Install the GPG key:
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

    # Ensure apt is set up to work with https sources:
    sudo apt-get install apt-transport-https

    #Select the channel to use:
    #############################
    #Stable
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

    # Dev
    # echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

    #Update apt sources and install Sublime Text
    sudo apt-get update
    sudo apt-get install sublime-text
#}
# install of sublime {
    sudo add-apt-repository ppa:a-v-shkop/chromium
    sudo apt-get update
    sudo apt-get install chromium-browser
#}


# config vim with spf13 {
    cd ~
    sh <(curl https://j.mp/spf13-vim3 -L)
    
    cd -
    cat ../cfg/vimrc.local >> ~/.vimrc.local 
# }

# install and config powerline {
    pip install powerline-status
    cd ~
    git clone https://github.com/powerline/fonts.git
    ./fonts/install.sh
    cd -
# }

# config bash {
    cat ../cfg/bashrc >> ~/.bashrc
    . ~/.bashrc

    echo "now config font of terminal to source code pro for powerline regular 12 "
    echo "then press any key to continue"
    read l
# }

# config tmux {
    ln -s ../cfg/tmux/.tmux.conf ~/.tmux.conf
    ln -s ../cfg/tmux/.tmux.conf.local ~/.tmux.conf.local
# }

