# users Cookbook
[![Build Status](https://travis-ci.org/chef-cookbooks/users.svg?branch=master)](http://travis-ci.org/chef-cookbooks/users) [![Cookbook Version](https://img.shields.io/cookbook/v/users.svg)](https://supermarket.chef.io/cookbooks/users)

Manages OS users from databags.

## Scope

This cookbook is concerned with the management of OS users and groups from databags. It also manages the distribution of ssh keys to a user's home directory.

## Requirements

A data bag populated with user objects must exist. The default data bag in this recipe is `users`. See USAGE.

### Chef

- Chef 11+

### Platform Support

The following platforms have been tested with Test Kitchen:

- Debian / Ubuntu and derivatives
- RHEL and derivatives 
- Fedora 
- FreeBSD / OpenBSD
- Mac OS X

### Cookbook Dependencies
- none

## Usage
To use the resource `users_manage`, make sure to add the dependency on the users cookbook by the following line to your wrapper cookbook's [metadata.rb](https://docs.chef.io/config_rb_metadata.html):

```
depends 'users'
```

or to pin to a specific version of the users cookbook, in this case any version of 2.X:

```
depends 'users', '~> 2'
```

Then in a recipe:

```ruby
users_manage 'GROUPNAME' do
  group_id GROUPID
  action [:remove, :create]
  data_bag 'DATABAG_NAME'
end
```

Example:

```ruby
users_manage 'testgroup' do
  group_id 3000
  action [:remove, :create]
  data_bag 'test_home_dir'
end
```

**Note**: If you do not specify the data_bag, the default will be to look for a databag called users.

## Databag Definition

A sample user object in a users databag would look like:

```json
{
  "id": "test_user",
  "password": "$1$5cE1rI/9$4p0fomh9U4kAI23qUlZVv/",
  "ssh_keys": [
    "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAklOUpkDHrfHY17SbrmTIpNLTGK9Tjom/BWDSU\nGPl+nafzlHDTYW7hdI4yZ5ew18JH4JW9jbhUFrviQzM7xlELEVf4h9lFX5QVkbPppSwg0cda3\nPbv7kOdJ/MTyBlWXFCR+HAo3FXRitBqxiX1nKhXpHAZsMciLq8V6RjsNAQwdsdMFvSlVK/7XA\nt3FaoJoAsncM1Q9x5+3V0Ww68/eIFmb1zuUFljQJKprrX88XypNDvjYNby6vw/Pb0rwert/En\nmZ+AW4OZPnTPI89ZPmVMLuayrD2cE86Z/il8b+gw3r3+1nKatmIkjn2so1d01QraTlMqVSsbx\nNrRFi9wrf+M7Q== chefuser@mylaptop.local",
    "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAklOUpkDHrfHY17SbrmTIpNLTGK9Tjom/BWDSU\nGPl+nafzlHDTYW7hdI4yZ5ew18JH4JW9jbhUFrviQzM7xlELEVf4h9lFX5QVkbPppSwg0cda3\nPbv7kOdJ/MTyBlWXFCR+HAo3FXRitBqxiX1nKhXpHAZsMciLq8V6RjsNAQwdsdMFvSlVK/7XA\nt3FaoJoAsncM1Q9x5+3V0Ww68/eIFmb1zuUFljQJKprrX88XypNDvjYNby6vw/Pb0rwert/En\nmZ+AW4OZPnTPI89ZPmVMLuayrD2cE86Z/il8b+gw3r3+1nKatmIkjn2so1d01QraTlMqVSsbx\nNQCPO0ZZEa1== chefuser@mylaptop.local"
  ],
  "groups": [ "testgroup", "nfsgroup" ],
  "uid": 9001,
  "shell": "\/bin\/bash",
  "comment": "Test User"
}
```

### Databag Key Definitions 

* `id`: *String* specifies the username, as well as the data bag object id.
* `password`: *String* specifies the user's password.
* `ssh_keys`: *Array* an array of authorized keys that will be managed by Chef to the user's home directory in .ssh/authorized_keys
* `groups`: *Array* an array of groups that the user will be added to
* `uid`: *Integer* a unique identifier for the user
* `shell`: *String* the user's shell
* `comment`:*String* the [GECOS field](https://en.wikipedia.org/wiki/Gecos_field), generally the User's full name.

Other potential fields:

* `home`: *String* User's home directory. If not assigned, will be set based on platform and username.
* `action`: *String* Supported actions are one's supported by the [user](https://docs.chef.io/resource_user.html#actions) resource. If not specified, the default action is `create`.
* `ssh_private_key`: *String* manages user's private key generally ~/.ssh/id_*
* `ssh_public_key`: *String* manages user's public key generally ~/.ssh/id_*.pub


## Resources Overview

### users_manage

The `users_manage` resource manages users and groups based off of a data bag search and specified action.

#### Examples

Creates the `sysadmin` group and users defined in the `users` databag.

```ruby
users_manage 'sysadmin' do
  group_id 2300
  action [:remove, :create]
end
```

Removes, then creates the `testgroup` group, and users defined in the `test_home_dir` databag.

```ruby
users_manage 'testgroup' do
  group_id 3000
  action [:remove, :create]
  data_bag 'test_home_dir'
end
```

Removes, then creates the `nfsgroup` group, and users defined in the `test_home_dir` databag and does not manage nfs home directories.

```ruby
users_manage 'nfsgroup' do
  group_id 4000
  action [:remove, :create]
  data_bag 'test_home_dir'
  manage_nfs_home_dirs false
end
```

#### Parameters

* `data_bag` *String* is the data bag to search
* `search_group` *String* groups name to search for, defaults to resource name
* `group_name` *String* name of the group to create, defaults to resource name
* `group_id` *Integer* numeric id of the group to create, default is to allow the OS to pick next
* `cookbook` *String* name of the cookbook that the authorized_keys template should be found in
* `manage_nfs_home_dirs` *Boolean* whether to manage nfs home directories.

Otherwise, this cookbook is specific for setting up `sysadmin` group and users with the sysadmins recipe for now.

## Recipe Overview

`sysadmins.rb`: recipe that manages the group sysadmins with group id 2300, and adds users to this group.

To use:

```ruby
include_recipe "users::sysadmins"
```

The recipe is defined as follows:

```ruby
users_manage "sysadmin" do
  group_id 2300
  action [ :remove, :create ]
end
```

This `users_manage` resource searches the `users` data bag for the `sysadmin` group attribute, and adds those users to a Unix security group `sysadmin`. The only required attribute is group_id, which represents the numeric Unix gid and _must_ be unique. The default action for the resource is `:create`.

The recipe, by default, will also create the sysadmin group. The sysadmin group will be created with GID 2300. This may become an attribute at a later date.

## Data bag Overview 

**Reminder** Data bags generally should not be stored in cookbooks, but in a policy repo within your organization. Data bags are useful across cookbooks, not just for a single cookbook.

Use knife to create a data bag for users.

```bash
$ knife data bag create users
```

Create a user in the data_bag/users/ directory.

An optional password hash can be specified that will be used as the user's password.

The hash can be generated with the following command.

```bash
$ openssl passwd -1 "plaintextpassword"
```

Note: The ssh_keys attribute below can be either a String or an Array. However, we are recommending the use of an Array.

```json
{
  "id": "bofh",
  "ssh_keys": "ssh-rsa AAAAB3Nz...yhCw== bofh"
}
```

```json
{
  "id": "bofh",
  "password": "$1$d...HgH0",
  "ssh_keys": [
    "ssh-rsa AAA123...xyz== foo",
    "ssh-rsa AAA456...uvw== bar"
  ],
  "groups": [ "sysadmin", "dba", "devops" ],
  "uid": 2001,
  "shell": "\/bin\/bash",
  "comment": "BOFH"
}
```

You can pass any action listed in the [user](http://docs.chef.io/chef/resources.html#user) resource for Chef via the "action" option. For Example:

Lock a user, johndoe1.

```bash
$ knife data bag edit users johndoe1
```

And then change the action to "lock":

```javascript
{
  "id": "johndoe1",
  "groups": ["sysadmin", "dba", "devops"],
  "uid": 2002,
  "action": "lock", // <--
  "comment": "User violated access policy"
}
```

Remove a user, johndoe1.

```bash
$ knife data bag edit users johndoe1
```

And then change the action to "remove":

```javascript
{
  "id": "johndoe1",
  "groups": [ "sysadmin", "dba", "devops" ],
  "uid": 2002,
  "action": "remove", // <--
  "comment": "User quit, retired, or fired."
}
```

- Note only user bags with the "action : remove" and a search-able "group" attribute will be purged by the :remove action.
- As of v2.0.3 you can use the force parameter within the user data bag object for users with action remove. As per [user docs](https://docs.chef.io/resource_user.html) this may leave the system in an inconsistent state. For example, a user account will be removed even if the user is logged in. A user’s home directory will be removed, even if that directory is shared by multiple users.

If you have different requirements, for example:
- You want to search a different data bag specific to a role such as
- mail. You may change the data_bag searched.
  - data_bag `mail`

- You want to search for a different group attribute named
- `postmaster`. You may change the search_group attribute. This
- attribute defaults to the LWRP resource name.
  - search_group `postmaster`

- You want to add the users to a security group other than the
- lightweight resource name. You may change the group_name attribute.
- This attribute also defaults to the LWRP resource name.
  - group_name `wheel`

Putting these requirements together our recipe might look like this:

```ruby
users_manage "postmaster" do
  data_bag "mail"
  group_name "wheel"
  group_id 10
end
```

Knife supports reading data bags from a file and automatically looks in a directory called +data_bags+ in the current directory. The "bag" should be a directory with JSON files of each item. For the above:

```bash
$ mkdir data_bags/users
$EDITOR data_bags/users/bofh.json
```

Paste the user's public SSH key into the ssh_keys value. Also make sure the uid is unique, and if you're not using bash, that the shell is installed. 

The Apache cookbook can set up authentication using OpenIDs, which is set up using the openid key here. See the Chef Software 'apache2' cookbook for more information about this.

## Chef Solo
As of version 1.4.0, this cookbook might work with Chef Solo when using [chef-solo-search by edelight](https://github.com/edelight/chef-solo-search). That cookbook is not a dependency of this one as Chef solo doesn't support dependency resolution using cookbook metadata - all cookbooks must be provided to the node manually when using Chef Solo.

## License & Authors
**Author:** Cookbook Engineering Team ([cookbooks@chef.io](mailto:cookbooks@chef.io))

**Copyright:** 2009-2016, Chef Software, Inc.

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
