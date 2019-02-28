# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for Static Pages', type: :routing do

  it 'routes root_path to the static pages controllers home action' do
    expect(get(root_path)).to route_to('static_pages#home')
  end

  it 'routes sign_up_success_path to the static pages controllers sign_up_success action' do
    expect(get(sign_up_success_path)).to route_to('static_pages#sign_up_success')
  end

  it 'routes sign_up_unconfirmed_path to the static pages controllers sign_up_unconfirmed action' do
    expect(get(sign_up_unconfirmed_path)).to route_to('static_pages#sign_up_unconfirmed')
  end

  it 'routes my_profile_path to the static pages controllers my_profile action' do
    expect(get(my_profile_path)).to route_to('static_pages#my_profile')
  end

  it 'routes product_overview_path to the static pages controllers product_overview action' do
    expect(get(product_overview_path)).to route_to('static_pages#product_overview')
  end

  it 'routes privacy_policy_path to the static pages controllers privacy_policy action' do
    expect(get(privacy_policy_path)).to route_to('static_pages#privacy_policy')
  end

  it 'routes terms_of_service_path to the static pages controllers terms_of_service action' do
    expect(get(terms_of_service_path)).to route_to('static_pages#terms_of_service')
  end

end
