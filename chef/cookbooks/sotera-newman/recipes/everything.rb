# Standalone / Vagrant install recipe
#
# Note -- Some commented out scripts DO NOT EXIST yet and may not!
# They are there as place holders from the previous provision script so that we know what order
# things originally ran in, AND, so that if we need to add that functionality, we can.


include_recipe "sotera-newman::repo"

# handles base setup and os configs -- may refactor later.
include_recipe "sotera-newman"

include_recipe "sotera-newman::igraph"
include_recipe "sotera-newman::os_update"
include_recipe "sotera-newman::software_install"


# DNE
#include_recipe "sotera-newman::mysql"


# Install Java -- This should be set as part of the node JSON information in Vagrant OR in a Chef Role in production
include_recipe "java"

include_recipe "sotera-newman::tangelo"
include_recipe "sotera-newman::spark"
include_recipe "sotera-newman::elasticsearch"
include_recipe "sotera-newman::kibana"
include_recipe "sotera-newman::newman"
include_recipe "sotera-newman::docker"


# fix permissions / ownership -- will need to refactor this logic later!!
execute "chown -R vagrant:vagrant /srv/software"