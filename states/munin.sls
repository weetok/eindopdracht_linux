munin-node:
    pkg.installed
    service.running:
        - watch:
            - file: /etc/munin/munin-node.conf

munin-node-configure --shell --families=contrib,auto | sh -x:
    cmd.run: []
    require:
        - pkg: munin-node

/etc/munin/munin-node.conf:
    file.replace:
        - append_if_not_found: True
        - pattern: |
            # cidr_allow 127.0.0.1/32
        - repl: |
            cidr_allow 10.4.1.27/32
