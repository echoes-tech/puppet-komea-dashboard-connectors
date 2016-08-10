#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with Komea Dashboard](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with Komea Dashboard Connectors](#beginning-with-komea-dashboard-connectors)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)
7. [Contributors](#contributors)

## Overview

Puppet module to manage Komea Dashboard connectors installation and configuration.

## Module Description

This module installs and configures [Komea Dashboard Connectors](https://echoes.fr/ksf/).

## Setup

### Setup Requirements

* **java** 1.7 or higher
* package **curl**
* package **zip/unzip**

Supports Puppet v3 (optionally with future parser) and v4 with Ruby versions 1.8.7 (Puppet v3 only), 1.9.3, 2.0.0 and 2.1.0.

### Beginning with Komea Dashboard Connectors

```puppet
include ::komea_dashboard_connectors
```

## Reference

### Classes

#### Public classes

* komea_dashboard_connectors: Main class, includes all other classes.

#### Private classes

* komea_dashboard_connectors::params: Sets parameter defaults per operating system.
* komea_dashboard_connectors::install: Handles the packages.
* komea_dashboard_connectors::config: Handles the configuration file.
* komea_dashboard_connectors::service: Handles the services.

#### Parameters

The following parameters are available in the `::komea_dashboard_connectors` class:

##### `version`

Specifies the Komea Dashboard's version that will be installed. Valid options: string. Default value: 'sprint'.

##### `jenkins_version`

Specifies the Jenkins packaging's version that will be installed. Valid options: string. Default value: '1.0.0'.

##### `cas_url`

Specifies the url of the CAS authentication service that will be used to handle authentication in Jenkins. Valid options: string. Default value: 'http://localhost:8080/cas'.

##### `nexus_url`

Specifies the url of the Nexus server that will be used to retrieve Komea Dashboard's artifacts. Valid options: string. Default value: _undef_.

##### `nexus_repository`

Specifies the name of the Nexus repository that contains Komea Dashboard's artifacts. Valid options: string. Default value: 'komea'.

##### `nexus_third_parties_repository`

Specifies the name of the Nexus repository that contains Komea Dashboard's third parties components _(ex: Apache ActiveMQ)_. Valid options: string. Default value: 'komea-third-parties'.

##### `nexus_user`

Specifies the username of a valid Nexus user with the necessary privileges to download all required artifacts. Valid options: string. Default value: _undef_.

##### `nexus_password`

Specifies the password of the Nexus user that will be used to download the required artifacts. Valid options: string. Default value: _undef_.

##### `base_location`

Specifies the path of the directory where Komea Dashboard components will be installed (the directory will be automatically created if it does not exist). Valid options: string. Default value: '/opt/echoes/dashboard-connectors'.

##### `logs_location`

Specifies the path of the directory that will contains all output logs of each Komea Dashboard's microservice. Valid options: string. Default value: '/var/log'.

##### `jenkins_port`

Specifies the running port of the Jenkins instance. Valid options: integer. Default value: 8099.

##### `jenkins_max_heap_size`

Specifies the maximum heap size that can be allocated to the Jenkins instance. Valid options: string. Default value: '128m'.

##### `jenkins_initial_heap_size`

Specifies the initial heap size that will be allocated to the Jenkins instance. Valid options: string. Default value: '32m'.

##### `connectors`

Specifies the list of connectors that will be installed. Valid options: array. Default value: ['redmine-connector', 'git-connector', 'jenkins-connector', 'kiuwan-connector'].

## Limitations

Debian family OSes are officially supported. Tested and built on Debian.

## Development

[Echoes Technologies](https://echoes.fr) modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great.

## Contributors

The list of contributors can be found at: https://github.com/echoes-tech/puppet-komea-dashboard-connectors/graphs/contributors
