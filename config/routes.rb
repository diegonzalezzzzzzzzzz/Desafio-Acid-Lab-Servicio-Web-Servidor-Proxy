Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'rest/verify_user/:email', to: 'authentication_proxy#login_is_valid?', :constraints => { :email => /.*/ }


end
