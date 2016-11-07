[DEFAULT]
debug = {{.Values.debug}}
syslog_log_facility=LOG_LOCAL0
use_syslog=yes
#admin_token =
enabled_drivers=pxe_ipmitool,agent_ipmitool
network_provider=neutron_plugin
enabled_network_drivers=neutron

[dhcp]
dhcp_provider=none

[api]
host_ip = 0.0.0.0

[conductor]
api_url = {{.Values.global.ironic_api_endpoint_protocol_internal}}://{{include "ironic_api_endpoint_host_internal" .}}:{{ .Values.global.ironic_api_port_internal }}
clean_nodes = false

[database]
connection = postgresql://{{.Values.db_user}}:{{.Values.db_password}}@{{include "ironic_db_host" .}}:{{.Values.global.postgres_port_public}}/{{.Values.db_name}}

[keystone_authtoken]
auth_uri = {{.Values.global.keystone_api_endpoint_protocol_internal}}://{{include "keystone_api_endpoint_host_internal" .}}:{{ .Values.global.keystone_api_port_internal }}
auth_url = {{.Values.global.keystone_api_endpoint_protocol_admin}}://{{include "keystone_api_endpoint_host_admin" .}}:{{ .Values.global.keystone_api_port_admin }}/v3
auth_type = v3password
username = {{ .Values.global.ironic_service_user }}
password = {{ .Values.global.ironic_service_password }}
user_domain_name = {{.Values.global.keystone_service_domain}}
project_name = {{.Values.global.keystone_service_project}}
project_domain_name = {{.Values.global.keystone_service_domain}}
memcache_servers = {{include "memcached_host" .}}:{{.Values.global.memcached_port_public}}
insecure = True

[glance]
glance_host = {{.Values.global.glance_api_endpoint_protocol_internal}}://{{include "glance_api_endpoint_host_internal" .}}:{{.Values.global.glance_api_port_internal}}
auth_strategy=keystone
swift_temp_url_key={{ .Values.swift_tempurl }}
swift_temp_url_duration=1200
swift_endpoint_url={{.Values.global.swift_endpoint_protocol}}://{{include "swift_endpoint_host" .}}:{{ .Values.global.swift_api_port_public }}
swift_api_version=v1
swift_account={{ .Values.swift_account }}

[neutron]
url = {{.Values.global.neutron_api_endpoint_protocol_internal}}://{{include "neutron_api_endpoint_host_internal" .}}:{{ .Values.global.neutron_api_port_internal }}
cleaning_network_uuid={{ .Values.network_cleaning_uuid }}
provisioning_network_uuid={{ .Values.network_management_uuid }}

[oslo_messaging_rabbit]
rabbit_userid = {{ .Values.global.rabbitmq_default_user }}
rabbit_password = {{ .Values.global.rabbitmq_default_pass }}
rabbit_host =  {{include "rabbitmq_host" .}}
rabbit_ha_queues = true

[oslo_middleware]
enable_proxy_headers_parsing = True