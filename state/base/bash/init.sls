include:
  - users

{% for usr in pillar.get('users', []) %}
{% set username = usr.username %}
/home/{{ username }}/.bash_profile:
  file.managed:
    - source: salt://bash/bash_profile
    - user: {{ username }}
    - group: {{ username }}
    - template: jinja
    - mode: 644
    - user: {{ username }}
    - group: {{ username }}


/home/{{ username }}/.bashrc:
  file.managed:
    - source: salt://bash/bashrc
    - user: {{ username}}
    - group: {{ username }}
    - template: jinja
    - mode: 644
    - user: {{ username }}
    - group: {{ username }}

/home/{{ username }}/.bashrc_includes:
  file.directory:
    - user: {{ username }}
    - group: {{ username }}
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
{% endfor %}
