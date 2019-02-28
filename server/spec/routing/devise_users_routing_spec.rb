# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for devise users', type: :routing do

  it 'routes new_user_registration_path to the user registrations controller' do
    expect(get(new_user_registration_path)).to route_to('user_registrations#new')
  end

  it 'routes new_user_session_path to the user registrations controller' do
    expect(get(new_user_session_path)).to route_to('user_sessions#new')
  end

  it 'routes destroy_user_session to the user sessions controller' do
    expect(delete(destroy_user_session_path)).to route_to('user_sessions#destroy')
  end

  it 'routes new_user_password_path to the user passwords controller' do
    expect(get(new_user_password_path)).to route_to('user_passwords#new')
  end

  it 'routes edit_user_password_path to the user passwords controller' do
    expect(get(edit_user_password_path)).to route_to('user_passwords#edit')
  end

end
