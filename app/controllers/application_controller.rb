require "ffcrm_tags/controller_actions"
class ApplicationController < ActionController::Base
  before_filter :get_tag_cloud_counts
  include FfcrmTags::ControllerActions
end
