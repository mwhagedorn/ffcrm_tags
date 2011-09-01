directory = File.expand_path(File.dirname(__FILE__))


[ "account", "campaign", "contact", "lead", "opportunity" ].each do |klass|
  require "#{Rails.root}/app/models/#{klass}.rb"
end


require File.join(directory, 'ffcrm_tags', 'models')
require File.join(directory, 'ffcrm_tags', 'controller_actions')
require File.join(directory, 'ffcrm_tags', 'view_helpers')
require File.join(directory, 'ffcrm_tags', 'controller_hooks')
require File.join(directory, 'ffcrm_tags', 'view_hooks')
require File.join(directory, 'ffcrm_tags', 'version')


