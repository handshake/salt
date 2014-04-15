{% for user in pillar.get('users', []) %}
{{ user.username }}:
  user:
    - absent
{% endfor %}
