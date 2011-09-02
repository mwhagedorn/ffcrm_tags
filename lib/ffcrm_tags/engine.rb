require "ffcrm_tags"
require "rails"



module Ffcrm_Tags
  class Engine < Rails::Engine
    
    initializer 'ffcrm_tags.app_controller',:after =>:disable_dependency_loading do |app|
          #ActiveSupport.on_load(:action_controller) do
          #  #include CrmTags::ControllerActions
          #
          #end
      require 'models'
    end
    #config.to_prepare

    #config.after_initialize do
    #
    #
    #      require 'models'
    #      require  'controller_actions'
    #      require 'view_helpers'
    #      require 'controller_hooks'
    #      require 'view_hooks'
    #      require 'version'
    #end
  end
end
