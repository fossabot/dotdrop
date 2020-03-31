echo "grc"

if [[ "$TERM" != dumb ]] && (( $+commands[grc] )) ; then

  # Supported commands
  cmds=(
    ant \
    blkid \
    configure \
    cvs \
    df \
    diff \
    dig \
    dnf \
    docker-machinels \
    dockerimages \
    dockerinfo \
    dockernetwork \
    dockerps \
    dockerpull \
    dockersearch \
    dockerversion \
    du \
    env \
    esperanto \
    fdisk \
    findmnt \
    free \
    gcc \
    getfacl \
    getsebool \
    id \
    ifconfig \
    iostat_sar \
    ip \
    ipaddr \
    ipneighbor \
    iproute \
    iptables \
    irclog \
    iwconfig \
    jobs \
    last \
    ldap \
    log \
    lolcat \
    ls \
    lsattr \
    lsblk \
    lsmod \
    lsof \
    lspci \
    mount \
    mtr \
    mvn \
    netstat \
    nmap \
    ntpdate \
    php \
    ping \
    ping2 \
    proftpd \
    ps \
    pv \
    semanageboolean \
    semanagefcontext \
    semanageuser \
    sensors \
    showmount \
    sql \
    ss \
    stat \
    sysctl \
    systemctl \
    tcpdump \
    traceroute \
    tune2fs \
    ulimit \
    uptime \
    vmstat \
    wdiff \
    whois \
  );

  # Set alias for available commands.
  for cmd in $cmds ; do
    if (( $+commands[$cmd] )) ; then
      alias $cmd="grc --colour=auto $(whence $cmd)"
    fi
  done

  # Clean up variables
  unset cmds cmd
fi
