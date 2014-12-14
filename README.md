# windows_role_base

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with windows_role_base](#setup)
    * [What windows_role_base affects](#what-windows_role_base-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with windows_role_base](#beginning-with-windows_role_base)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module will apply the windows_base module. Userdata is in this module.

## Module Description

This module will set up your Windows box in next to no time. It will install your favorite software, as defined in a yaml file. It will also create local users.

## Setup



### What windows_role_base affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled,
etc.), mention it here.

### Beginning with windows_role_base

Open command prompt as administrator. Go to C:\Windows\Temp. Create a file called Bootstrap.bat. Paste the content of the following file in it and run it! https://raw.githubusercontent.com/rudibroekhuizen/puppet-windows_role_base/master/files/Bootstrap.bat.

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
