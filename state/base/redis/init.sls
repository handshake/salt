redis:
  pkg:
    - installed

  file:
    - managed
    - source: salt://redis/redis.conf
    - name: /etc/redis.conf
    - user: redis
    - group: redis
    - template: jinja
    - require:
      - pkg: redis

  service:
    - running
    - enable: True
    - watch:
      - file: /etc/redis.conf
      - pkg: redis

