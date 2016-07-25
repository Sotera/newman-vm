default[:apt_repo][:freight][:packages] = {
    "freight" => "latest",
    "apt-mirror" => "latest",
    "gnupg2" => "latest",
    "rng-tools" => "latest"
}




default[:apt_repo][:freight][:freight_base_dir] = "/var/repositories"
default[:apt_repo][:freight][:freight_gpg_key] = "support@email.com"
default[:apt_repo][:freight][:repo_user] = "freight"
default[:apt_repo][:freight][:repo_group] = "freight"
default[:apt_repo][:freight][:signing_key] = "changeme"

default[:apt_repo][:freight][:master_gpg_private_key][:data_bag] = "gpg_keys"
default[:apt_repo][:freight][:master_gpg_private_key][:item] = "apt_repo_master_key"
default[:apt_repo][:freight][:master_gpg_private_key][:json_key] = "private"


default[:apt_repo][:freight][:master_gpg_public_key][:data_bag] = "gpg_keys"
default[:apt_repo][:freight][:master_gpg_public_key][:item] = "apt_repo_master_key"
default[:apt_repo][:freight][:master_gpg_public_key][:json_key] = "public"


default[:apt_repo][:freight][:signing_gpg_private_key][:data_bag] = "gpg_keys"
default[:apt_repo][:freight][:signing_gpg_private_key][:item] = "apt_repo_signing_key"
default[:apt_repo][:freight][:signing_gpg_private_key][:json_key] = "private"


default[:apt_repo][:freight][:signing_gpg_public_key][:data_bag] = "gpg_keys"
default[:apt_repo][:freight][:signing_gpg_public_key][:item] = "apt_repo_signing_key"
default[:apt_repo][:freight][:signing_gpg_public_key][:json_key] = "public"


default[:apt_repo][:freight][:nginx][:sites_available_dir] = "/etc/nginx/sites-available"
default[:apt_repo][:freight][:nginx][:sites_enabled_dir] = "/etc/nginx/sites-enabled"
default[:apt_repo][:freight][:nginx][:www_root] = "/var/repositories"