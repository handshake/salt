include:
  - openssl

nginx:
  pkg.latest:
    - require:
      - pkg: openssl

  service:
    - running
    - enable: True
    - watch:
        - pkg: nginx
        - pkg: openssl
