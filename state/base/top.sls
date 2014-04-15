base:
  '*':
    - core
    #- security

  'os_family:Debian':
    - match: grain
    - epel

  'os_family:RedHat':
    - match: grain
    - apt

  G@roles:brain:
    - match: compound
    - rabbitmq
    - redis
    - nfs
    - syslog_ng

  G@roles:proxy:
    - match: compound
    - nginx
    - syslog_ng

  G@roles:frontend:
    - match: compound
    - django
    - stunnel
    - syslog_ng

  G@roles:worker:
    - match: compound
    - celery
    - stunnel
    - syslog_ng

  G@roles:maintenance:
    - match: compound
    - celerybeat

  G@roles:db_master:
    - match: compound
    - syslog_ng

dev:
  G@virtualbox:VirtualBox:
    - match: compound
    - django
    - nfs
    - nginx
    - python
    - rabbitmq
    - redis
    - stunnel
    - syslog_ng
