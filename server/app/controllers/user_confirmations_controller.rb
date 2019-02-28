# frozen_string_literal: true

# Overrides for Device's ConfirmationsController
class UserConfirmationsController < Devise::ConfirmationsController

  protected

  def after_confirmation_path_for(resource_name, resource)
    if signed_in?(resource_name)
      signed_in_root_path(resource)
    else
      sign_up_success_path
    end
  end

end
