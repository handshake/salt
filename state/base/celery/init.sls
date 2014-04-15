include:
  - nix
  - python

python-celery:
  pkg.installed

/etc/init.d/celeryd:
  file.managed:
    - source: salt://celeryd/celeryd.init
    - mode: 755
    - require:
      - pkg: python-celery

  {% if grains['os_family'] == 'RedHat' %}
  cmd.run:
    - name: chkconfig --add celeryd
    - unless: chkconfig --list celeryd
    - require:
      - file: /etc/init.d/celeryd
  {% endif %}

# TODO: Move to a 'worker' state
#/etc/sysconfig/celeryd:
#  file.managed:
#    - source: salt://celery/celeryd.sysconfig
#    - template: jinja
#    - require:
#      - pkg: celery_package

celeryd:
  service.disabled:
    - require:
      - pkg: celery package
      - file: /etc/sysconfig/celeryd
      - file: /etc/init.d/celeryd

