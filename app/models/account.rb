class Account < ActiveRecord::Base
    acts_as_taggable_on :tags
end