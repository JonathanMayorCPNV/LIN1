HOSTNAME="SRV-LIN-02"
sudo hostnamectl set-hostname $HOSTNAME

net_FILE="/etc/network/interfaces"
sudo bash -c "cat <<EOM >$net_FILE

# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto ens32
iface ens32 inet static
address 10.10.10.12
netmask 255.255.255.0
gateway 10.10.10.2

EOM"

dns_FILE="/etc/resolv.conf"
sudo bash -c "cat <<EDM >$dns_FILE

domain localdomain
search localdomain
nameserver 10.10.10.12
nameserver 10.10.10.2

EDM" 