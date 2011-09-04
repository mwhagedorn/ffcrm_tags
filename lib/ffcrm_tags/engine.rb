require 'acts-as-taggable-on'
require "ffcrm_tags"
require "rails"




module Ffcrm_Tags
  class Engine < Rails::Engine
    initializer "ffcrm_tags.load_engine_classes" do |app|
       #make engine classes load first so they can be monkey-patched in calling app
       directory = File.expand_path(File.dirname(__FILE__))
       require File.join(directory,'load_engine_classes')
    end
    initializer "ffcrm_tags.add_view_helpers" do |app|
      ActiveSupport.on_load :action_view do
          directory = File.expand_path(File.dirname(__FILE__))
          require File.join(directory,'view_helpers')
          include FfcrmTags::ViewHelpers
      end
    end

    config.after_initialize do
           directory = File.expand_path(File.dirname(__FILE__))
           require File.join(directory,'controller_actions')
           require File.join(directory,'controller_hooks')
           require File.join(directory,'view_hooks')
           require File.join(directory, 'version')
    end
  end
end
