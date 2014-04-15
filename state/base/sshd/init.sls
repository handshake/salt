{% if grains['os_family'] == 'Debian' %}
  {% set service_name = 'ssh' %}
{% else %}
  {% set service_name = 'sshd' %}
{% endif %}

include:
  - openssl

openssh-server:
  pkg.installed

sshd:
  service:
    - running
    - name: {{ service_name }}
    - enable: True
    - watch:
      - pkg: openssh-server
      - pkg: openssl

