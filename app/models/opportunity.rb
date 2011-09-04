class Opportunity < ActiveRecord::Base
   acts_as_taggable_on :tags
end