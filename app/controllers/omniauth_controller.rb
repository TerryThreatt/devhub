# frozen_string_literal: true

class OmniauthController < ApplicationController
  # You should configure your model like this:
#   devise :omniauthable, omniauth_providers: %i[:github]

  # You should also create an action method in this controller like this:
   def github
      @user = User.create_from_provider_data(request.env['omniauth.auth'])
      if @user.persisted?
      sign_in_and_redirect @user
      else
      flash[:error] = "There was a problem signing in through Github."
      redirect_to new_user_registration_url
      end
   end

   def failure
      flash[:error] = "There was a problem signing in through Github."
      redirect_to new_user_registration_url
   end

end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  def passthru
      super
  end

  # GET|POST /users/auth/twitter/callback
  def failure
     # super
     redirect_to root_path
  end

#   protected

# #   # The path used when OmniAuth fails
#   def after_omniauth_failure_path_for(scope)
#      super(scope)
#   end