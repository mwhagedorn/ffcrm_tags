Rails.application.routes.draw do |map|
  match "/accounts/tagged/:id" => "accounts#tagged"
  match "/campaigns/tagged/:id" => "campaigns#tagged"
  match "/contacts/tagged/:id" => "contacts#tagged"
  match "/leads/tagged/:id" => "leads#tagged"
  match "/opportunities/tagged/:id" => "opportunities#tagged"
end
