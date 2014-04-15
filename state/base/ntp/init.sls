{% if grains['os_family'] == 'Debian' %}
  {% set service_name = 'ntp' %}
{% else %}
  {% set service_name = 'ntpd' %}
{% endif %}

ntp:
  pkg:
    - installed

  service:
    - running
    - name: {{ service_name }}
    - enable: true
    - require:
      - pkg: ntp
    - watch:
      - file: /etc/ntp.conf

  file.managed:
    - name: /etc/ntp.conf
    - source: salt://ntp/ntp.conf
    - mode: 644

ntp_force_update:
  cmd.wait:
    - name: service {{ service_name }} stop && {{ service_name }} -gq && service {{ service_name }} start
    - watch:
      - file: /etc/ntp.conf


