# frozen_string_literal: true

# name: discourse-plugin-rake-commands
# about: Add custom rake commands
# version: 0.0.1
# authors: Boris Tronquoy
# url: https://github.com/btronquo/plugin-discourse-rake-helpers
# required_version: 2.7.0

enabled_site_setting :plugin_name_enabled

module ::MyPluginModule
  PLUGIN_NAME = "discourse-plugin-rake-commands"
end

# require_relative "lib/my_plugin_module/engine"

after_initialize do
  # Code which should run after Rails has finished booting
end
