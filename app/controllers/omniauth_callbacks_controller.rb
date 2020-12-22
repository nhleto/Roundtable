# frozen_string_literal: true

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]
  skip_before_action :verify_authenticity_token
  # You should also create an action method in this controller like this:

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      set_flash_message(:alert, :failure, kind: "Google", reason: 'this email is associated with another account')
      session['devise.google_oauth2_data'] = request.env['omniauth.auth']
      redirect_to request.referrer
    end
  end

  def github
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
    else
      set_flash_message(:alert, :failure, kind: "Github", reason: 'this email is associated with another account')
      session['devise.github_data'] = request.env['omniauth.auth']
      redirect_to request.referrer
    end
  end

  def failure
    redirect_to root_path
  end
  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
