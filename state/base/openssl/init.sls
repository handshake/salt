openssl:
  {% if grains['os_family'] == 'RedHat' %}
  pkg.installed:
    - version: 1.0.1e-16.el6_5.7
  {% elif grains ['os_family'] == 'Debian' %}
  pkg.latest
  {% endif %}

