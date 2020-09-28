    # Garantindo as chaves
    KEY_PATH='/home/infrati/Documents/workspaces/linuxtips-wkspace/files'
    mkdir -p /root/.ssh
    cp $KEY_PATH/key /root/.ssh/id_rsa
    cp $KEY_PATH/key.pub /root/.ssh/id_rsa.pub
    cp $KEY_PATH/key.pub /root/.ssh/authorized_keys
    chmod 400 /root/.ssh/id_rsa*
    cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

     HOST_IP="192.168.99"

    # Garantindo os hosts
    HOSTS=$(head -n7 /etc/hosts)
    echo -e "$HOSTS" > /etc/hosts
    echo '192.168.99.10 worker01.linuxtips' >> /etc/hosts
    echo '192.168.99.20 worker02.linuxtips' >> /etc/hosts
    echo '192.168.99.30 worker03.linuxtips' >> /etc/hosts

    # Garantindo q o usuario suporte esteja presente
    sudo adduser suporte
    #usermod -aG wheel suporte

    # Criando arquivo de SWAP 
    fallocate -l 1G /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    echo -e "/swapfile swap swap defaults 0 0" >> /etc/fstab
    swapon -a

    # for Centos
    # sudo -i
    # adduser suporte
    # usermod -aG wheel suporte
    # passwd suporte