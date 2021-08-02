Ansible Role: Janus Gateway
=========

![Molecule](https://img.shields.io/github/workflow/status/bitsy-ai/ansible-role-janus-gateway/Molecule)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/bitsy-ai/ansible-role-janus-gateway)
![GitHub last commit](https://img.shields.io/github/last-commit/bitsy-ai/ansible-role-janus-gateway)

An Ansible role to install and configure [janus-gateway](https://github.com/meetecho/janus-gateway), a general-purpose WebRTC server.

Supported Platforms & Architectures
------------

| Platform | Version | armhf | aarch64 | amd64 |
|----------|---------|-------|---------|-------|
| Debian   | buster  | ✅    |     ✅   |   ✅  |

Requirements
------------

The development of this role requires Molecule >= 3.3

```
$ python3 -m pip install "molecule[ansible,lint,docker]" 
```

```
$ molecule --version
molecule 3.3.4 using python 3.8 
    ansible:2.11.3
    delegated:3.3.4 from molecule
    docker:0.2.4 from molecule_docker
```

See [Molecule's installation docs](https://molecule.readthedocs.io/en/latest/installation.html) for additional install methods and options. 

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml) for this roles's configurable variables and default values.


Dependencies
------------

None yet

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: raspberry-pi-cctvs
      roles:
         - { role: bitsyai.janus_gateway, ... }

License
-------

GPLv3

Author Information
------------------

https://bitsy.ai/about/
