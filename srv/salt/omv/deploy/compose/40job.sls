# @license   http://www.gnu.org/licenses/gpl.html GPL Version 3
# @author    OpenMediaVault Plugin Developers <plugins@omv-extras.org>
# @copyright Copyright (c) 2024 OpenMediaVault Plugin Developers
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

{% set config = salt['omv_conf.get']('conf.service.compose.job') %}

configure_compose_scheduled_backup:
  file.managed:
    - name: "/etc/cron.d/omv-compose-backup"
    - source:
      - salt://{{ tpldir }}/files/backup.j2
    - template: jinja
    - context:
        jobs: {{ config | json }}
    - user: root
    - group: root
    - mode: 644

configure_compose_scheduled_update:
  file.managed:
    - name: "/etc/cron.d/omv-compose-update"
    - source:
      - salt://{{ tpldir }}/files/update.j2
    - template: jinja
    - context:
        jobs: {{ config | json }}
    - user: root
    - group: root
    - mode: 644

configure_compose_scheduled_prune:
  file.managed:
    - name: "/etc/cron.d/omv-compose-prune"
    - source:
      - salt://{{ tpldir }}/files/prune.j2
    - template: jinja
    - context:
        jobs: {{ config | json }}
    - user: root
    - group: root
    - mode: 644

configure_compose_scheduled_start:
  file.managed:
    - name: "/etc/cron.d/omv-compose-start"
    - source:
      - salt://{{ tpldir }}/files/start.j2
    - template: jinja
    - context:
        jobs: {{ config | json }}
    - user: root
    - group: root
    - mode: 644

configure_compose_scheduled_stop:
  file.managed:
    - name: "/etc/cron.d/omv-compose-stop"
    - source:
      - salt://{{ tpldir }}/files/stop.j2
    - template: jinja
    - context:
        jobs: {{ config | json }}
    - user: root
    - group: root
    - mode: 644
