# Common *nix tools and packages
nix_packages:
  pkg.installed:
    - pkgs:
      - curl
      - iotop
      - logrotate
      - lsof
      - nmon
      - strace
      - tcpdump
      - telnet
      - unzip
      - wget
      {% if grains['os_family'] == 'Debian' %}
      - systemtap-sdt-dev
      - netcat
      {% elif grains ['os_family'] == 'RedHat' %}
      - dtrace
      - nc
      {% endif %}

