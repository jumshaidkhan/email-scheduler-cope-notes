# frozen_string_literal: true

module Authenticator
  extend ActiveSupport::Concern
  # include DeviseTokenAuth::Concerns::SetUserByToken
  included do
    before_action :authenticate_user!
    skip_before_action :authenticate_user!, if: :devise_controller?
    protect_from_forgery with: :exception, prepend: true
    skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_user!, only: :status
  end

  
end

