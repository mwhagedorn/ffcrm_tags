
 [ Account, Campaign, Contact, Lead, Opportunity ].each do |klass|
   require "#{Rails.root}/app/models/#{klass.name.downcase}.rb"
 end