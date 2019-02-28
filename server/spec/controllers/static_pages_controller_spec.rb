# frozen_string_literal: true

require 'rails_helper'
require 'support/utilities'
require 'support/shared_examples/user_authentication'
require 'support/shared_examples/controllers'

RSpec.describe StaticPagesController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }

  describe 'GET #home' do

    context 'when a user is signed in' do
      before do
        sign_in(user)
        get :home
      end

      it_behaves_like 'a successfull page render', 'home'
    end

    context 'when not signed in' do
      before do
        get :home
      end

      it_behaves_like 'a successfull page render', 'home'
    end
  end

  describe 'GET #sign_up_success' do
    before { get :sign_up_success }

    it_behaves_like 'a successfull page render', 'sign_up_success'
  end

  describe 'GET #sign_up_unconfirmed' do
    before { get :sign_up_unconfirmed }

    it_behaves_like 'a successfull page render', 'sign_up_unconfirmed'
  end

  describe 'GET #my_profile' do
    let(:action) { :my_profile }

    context 'when a user is signed in' do
      before do
        user.save!
        sign_in(user)
        get action
      end

      it_behaves_like 'a successfull page render', 'my_profile'

      it 'assigns @signed_up_at' do
        expect(assigns(:signed_up_at)).to be_within(0.000001.seconds).of user.created_at
      end
    end

    context 'when not signed in' do
      before { get action }
      include_examples 'signed in user only'
    end
  end

  describe 'GET #product_overview' do
    before { get :product_overview }
    it_behaves_like 'a successfull page render', 'product_overview'
  end

  describe 'GET #privacy_policy' do
    before { get :privacy_policy }
    it_behaves_like 'a successfull page render', 'privacy_policy'
  end

end
