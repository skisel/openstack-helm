{
    "context_is_cloud_admin":  "role:cloud_network_admin",
    "context_is_network_admin":  "role:network_admin",
    "context_is_admin":  "rule:context_is_cloud_admin",
    "owner": "tenant_id:%(tenant_id)s",
    "is_network_owner":"tenant_id:%(network:tenant_id)s",
    "admin_or_owner": "rule:owner or rule:context_is_network_admin or rule:context_is_cloud_admin",
    "cloud_admin_or_network_admin": "rule:context_is_admin or (rule:owner and rule:context_is_network_admin)",
    "context_is_advsvc":  "role:advsvc",
    "admin_or_network_owner": "rule:context_is_admin or tenant_id:%(network:tenant_id)s",
    "admin_owner_or_network_owner": "rule:owner or rule:admin_or_network_owner",
    "admin_only": "rule:context_is_admin",
    "regular_user": "",
    "shared": "field:networks:shared=True",
    "shared_firewalls": "field:firewalls:shared=True",
    "shared_firewall_policies": "field:firewall_policies:shared=True",
    "shared_subnetpools": "field:subnetpools:shared=True",
    "shared_address_scopes": "field:address_scopes:shared=True",
    "external": "field:networks:router:external=True",
    "default": "rule:admin_or_owner or rule:shared",

    "create_subnet": "rule:admin_or_network_owner",
    "create_subnet:segment_id": "rule:admin_only",
    "get_subnet": "rule:admin_or_owner or rule:shared",
    "get_subnet:segment_id": "rule:admin_only",
    "update_subnet": "rule:admin_or_network_owner",
    "delete_subnet": "rule:admin_or_network_owner",

    "create_subnetpool": "rule:cloud_admin_or_network_admin",
    "create_subnetpool:shared": "rule:admin_only",
    "create_subnetpool:is_default": "rule:admin_only",
    "get_subnetpool": "rule:admin_or_owner or rule:shared_subnetpools",
    "update_subnetpool": "rule:admin_or_owner",
    "update_subnetpool:is_default": "rule:admin_only",
    "delete_subnetpool": "rule:admin_or_owner",

    "create_address_scope": "rule:cloud_admin_or_network_admin",
    "create_address_scope:shared": "rule:admin_only",
    "get_address_scope": "rule:admin_or_owner or rule:shared_address_scopes",
    "update_address_scope": "rule:admin_or_owner",
    "update_address_scope:shared": "rule:admin_only",
    "delete_address_scope": "rule:admin_or_owner",

    "create_network": "rule:cloud_admin_or_network_admin",
    "get_network": "rule:cloud_admin_or_network_admin or rule:shared or rule:external or rule:context_is_advsvc",
    "get_network:router:external": "rule:regular_user",
    "get_network:segments": "rule:admin_only",
    "get_network:provider:network_type": "rule:admin_only",
    "get_network:provider:physical_network": "rule:admin_only",
    "get_network:provider:segmentation_id": "rule:admin_only",
    "get_network:queue_id": "rule:admin_only",
    "get_network_ip_availabilities": "rule:admin_only",
    "get_network_ip_availability": "rule:admin_only",
    "create_network:shared": "rule:admin_only",
    "create_network:router:external": "rule:admin_only",
    "create_network:is_default": "rule:admin_only",
    "create_network:segments": "rule:admin_only",
    "create_network:provider:network_type": "rule:admin_only",
    "create_network:provider:physical_network": "rule:admin_only",
    "create_network:provider:segmentation_id": "rule:admin_only",
    "update_network": "rule:cloud_admin_or_network_admin",
    "update_network:segments": "rule:admin_only",
    "update_network:shared": "rule:admin_only",
    "update_network:provider:network_type": "rule:admin_only",
    "update_network:provider:physical_network": "rule:admin_only",
    "update_network:provider:segmentation_id": "rule:admin_only",
    "update_network:router:external": "rule:admin_only",
    "delete_network": "rule:cloud_admin_or_network_admin",

    "create_segment": "rule:admin_only",
    "get_segment": "rule:admin_only",
    "update_segment": "rule:admin_only",
    "delete_segment": "rule:admin_only",

    "network_device": "field:port:device_owner=~^network:",
    "create_port": "",
    "create_port:device_owner": "not rule:network_device or rule:context_is_advsvc or rule:admin_or_network_owner",
    "create_port:mac_address": "rule:context_is_advsvc or rule:admin_or_network_owner",
    "create_port:fixed_ips": "rule:context_is_advsvc or rule:default",
    "create_port:port_security_enabled": "rule:context_is_advsvc or rule:admin_or_network_owner",
    "create_port:binding:host_id": "rule:admin_only",
    "create_port:binding:profile": "rule:admin_only",
    "create_port:mac_learning_enabled": "rule:context_is_advsvc or rule:admin_or_network_owner",
    "create_port:allowed_address_pairs": "rule:admin_or_network_owner",
    "get_port": "rule:context_is_advsvc or rule:admin_owner_or_network_owner",
    "get_port:queue_id": "rule:admin_only",
    "get_port:binding:vif_type": "rule:admin_only",
    "get_port:binding:vif_details": "rule:admin_only",
    "get_port:binding:host_id": "rule:admin_only",
    "get_port:binding:profile": "rule:admin_only",
    "update_port": "rule:admin_or_owner or rule:context_is_advsvc",
    "update_port:device_owner": "not rule:network_device or rule:context_is_advsvc or rule:admin_or_network_owner",
    "update_port:mac_address": "rule:admin_only or rule:context_is_advsvc",
    "update_port:fixed_ips": "rule:context_is_advsvc or rule:admin_or_network_owner",
    "update_port:port_security_enabled": "rule:context_is_advsvc or rule:admin_or_network_owner",
    "update_port:binding:host_id": "rule:admin_only",
    "update_port:binding:profile": "rule:admin_only",
    "update_port:mac_learning_enabled": "rule:context_is_advsvc or rule:admin_or_network_owner",
    "update_port:allowed_address_pairs": "rule:admin_or_network_owner",
    "delete_port": "rule:context_is_advsvc or rule:admin_owner_or_network_owner",

    "get_router:ha": "rule:admin_only",
    "create_router": "rule:cloud_admin_or_network_admin",
    "create_router:external_gateway_info:enable_snat": "rule:admin_only",
    "create_router:distributed": "rule:admin_only",
    "create_router:ha": "rule:admin_only",
    "get_router": "rule:admin_or_owner",
    "get_router:distributed": "rule:admin_only",
    "update_router:external_gateway_info:enable_snat": "rule:admin_only",
    "update_router:distributed": "rule:admin_only",
    "update_router:ha": "rule:admin_only",
    "delete_router": "rule:admin_or_owner",

    "add_router_interface": "rule:admin_or_owner",
    "remove_router_interface": "rule:admin_or_owner",

    "create_router:external_gateway_info:external_fixed_ips": "rule:admin_only",
    "update_router:external_gateway_info:external_fixed_ips": "rule:admin_only",

    "create_firewall": "",
    "get_firewall": "rule:admin_or_owner",
    "create_firewall:shared": "rule:admin_only",
    "get_firewall:shared": "rule:admin_only",
    "update_firewall": "rule:admin_or_owner",
    "update_firewall:shared": "rule:admin_only",
    "delete_firewall": "rule:admin_or_owner",

    "create_firewall_policy": "",
    "get_firewall_policy": "rule:admin_or_owner or rule:shared_firewall_policies",
    "create_firewall_policy:shared": "rule:admin_or_owner",
    "update_firewall_policy": "rule:admin_or_owner",
    "delete_firewall_policy": "rule:admin_or_owner",

    "insert_rule": "rule:admin_or_owner",
    "remove_rule": "rule:admin_or_owner",

    "create_firewall_rule": "",
    "get_firewall_rule": "rule:admin_or_owner or rule:shared_firewalls",
    "update_firewall_rule": "rule:admin_or_owner",
    "delete_firewall_rule": "rule:admin_or_owner",

    "create_qos_queue": "rule:admin_only",
    "get_qos_queue": "rule:admin_only",

    "update_agent": "rule:admin_only",
    "delete_agent": "rule:admin_only",
    "get_agent": "rule:admin_only",

    "create_dhcp-network": "rule:admin_only",
    "delete_dhcp-network": "rule:admin_only",
    "get_dhcp-networks": "rule:admin_only",
    "create_l3-router": "rule:admin_only",
    "delete_l3-router": "rule:admin_only",
    "get_l3-routers": "rule:admin_only",
    "get_dhcp-agents": "rule:admin_only",
    "get_l3-agents": "rule:admin_only",
    "get_loadbalancer-agent": "rule:admin_only",
    "get_loadbalancer-pools": "rule:admin_only",
    "get_agent-loadbalancers": "rule:admin_only",
    "get_loadbalancer-hosting-agent": "rule:admin_only",

    "create_floatingip": "rule:regular_user",
    "create_floatingip:floating_ip_address": "rule:admin_only",
    "update_floatingip": "rule:admin_or_owner",
    "delete_floatingip": "rule:admin_or_owner",
    "get_floatingip": "rule:admin_or_owner",

    "create_network_profile": "rule:admin_only",
    "update_network_profile": "rule:admin_only",
    "delete_network_profile": "rule:admin_only",
    "get_network_profiles": "",
    "get_network_profile": "",
    "update_policy_profiles": "rule:admin_only",
    "get_policy_profiles": "",
    "get_policy_profile": "",

    "create_metering_label": "rule:admin_only",
    "delete_metering_label": "rule:admin_only",
    "get_metering_label": "rule:admin_only",

    "create_metering_label_rule": "rule:admin_only",
    "delete_metering_label_rule": "rule:admin_only",
    "get_metering_label_rule": "rule:admin_only",

    "get_service_provider": "rule:regular_user",
    "get_lsn": "rule:admin_only",
    "create_lsn": "rule:admin_only",

    "create_flavor": "rule:admin_only",
    "update_flavor": "rule:admin_only",
    "delete_flavor": "rule:admin_only",
    "get_flavors": "rule:regular_user",
    "get_flavor": "rule:regular_user",
    "create_service_profile": "rule:admin_only",
    "update_service_profile": "rule:admin_only",
    "delete_service_profile": "rule:admin_only",
    "get_service_profiles": "rule:admin_only",
    "get_service_profile": "rule:admin_only",

    "get_policy": "rule:regular_user",
    "create_policy": "rule:admin_only",
    "update_policy": "rule:admin_only",
    "delete_policy": "rule:admin_only",
    "get_policy_bandwidth_limit_rule": "rule:regular_user",
    "create_policy_bandwidth_limit_rule": "rule:admin_only",
    "delete_policy_bandwidth_limit_rule": "rule:admin_only",
    "update_policy_bandwidth_limit_rule": "rule:admin_only",
    "get_policy_dscp_marking_rule": "rule:regular_user",
    "create_policy_dscp_marking_rule": "rule:admin_only",
    "delete_policy_dscp_marking_rule": "rule:admin_only",
    "update_policy_dscp_marking_rule": "rule:admin_only",
    "get_rule_type": "rule:regular_user",

    "restrict_wildcard": "(not field:rbac_policy:target_tenant=*) or rule:admin_only",
    "create_rbac_policy": "rule:cloud_admin_or_network_admin",
    "create_rbac_policy:target_tenant": "rule:restrict_wildcard",
    "update_rbac_policy": "rule:cloud_admin_or_network_admin",
    "update_rbac_policy:target_tenant": "rule:restrict_wildcard and rule:cloud_admin_or_network_admin",
    "get_rbac_policy": "rule:admin_or_owner",
    "delete_rbac_policy": "rule:cloud_admin_or_network_admin",

    "create_flavor_service_profile": "rule:admin_only",
    "delete_flavor_service_profile": "rule:admin_only",
    "get_flavor_service_profile": "rule:regular_user",
    "get_auto_allocated_topology": "rule:admin_or_owner"
}
