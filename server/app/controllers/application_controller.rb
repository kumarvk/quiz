# frozen_string_literal: true

class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  # recommended for i18n with the gettext_i18n_rails gem
  before_action :set_gettext_locale

  def set_flash_changes_saved(now = false)
    message = _('Your changes have been saved')
    now ? (flash.now[:success] = message) : (flash[:success] = message)
  end

  def authenticate_owner!(type_symbol)
    type = type_symbol.to_s
    klass = type.camelize.constantize

    object = klass.find(params[:id])

    process_unpermitted unless current_user.id == object.user_id

    instance_variable_set("@#{type}".to_sym, object)
  end

  def process_unpermitted
    flash[:warning] = _('You are not permitted to visit this page')
    redirect_to root_path
  end

  def prepare_currency_param_value(params, currency_key)
    params[currency_key] = params[currency_key].gsub(/[\$\,]/, '')
    params
  end

end
