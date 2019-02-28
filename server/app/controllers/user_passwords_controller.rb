# frozen_string_literal: true

# Overrides for Device's PasswordsController
class UserPasswordsController < Devise::PasswordsController

  respond_to :js

  layout 'blank'

  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name)) do |format|
        format.js { render 'devise/passwords/reset_password_link_sent' }
      end
    else
      respond_with(resource) do |format|
        format.html { render action: 'new' }
        format.js { render 'new' }
      end
    end
  end

  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      if Devise.sign_in_after_reset_password
        flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
        set_flash_message!(:notice, flash_message)
        sign_in(resource_name, resource)
      else
        set_flash_message!(:notice, :updated_not_active)
      end
      respond_with resource, location: after_resetting_password_path_for(resource)
    else
      if resource.errors.messages[:reset_password_token].blank?
        set_minimum_password_length
        respond_with resource
      else
        flash[:error] = _('Reset password token is invalid')
        redirect_to after_resetting_password_path_for(resource)
      end
    end
  end

  protected

  def after_sending_reset_password_instructions_path_for(_ignored)
    reset_password_link_sent_path if is_navigational_format?
  end

end
