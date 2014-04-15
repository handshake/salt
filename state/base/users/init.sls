{% for usr in pillar.get('users', []) %}
{{ usr.username }}:
  user.present:
    - fullname: {{ usr.fullname }}
    - uid: {{ usr.uid }}
    - shell: /bin/bash
    - home: /home/{{ usr.username }}
    - createhome: true
    - groups:
      {% for group in usr.get('groups', []) %}
      - {{ group }}
      {% endfor %}
{% endfor %}
