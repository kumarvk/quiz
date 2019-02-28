# frozen_string_literal: true

RSpec.shared_examples 'signed in user only' do
  it 'redirects to new_user_session_path' do
    expect(response).to redirect_to(:new_user_session)
  end

  it 'sets a flash alert' do
    expect(flash[:alert]).to eq _('You need to sign in or sign up before continuing.')
  end
end

RSpec.shared_examples 'owner only' do
  it 'redirects to root' do
    expect(response).to redirect_to(:root)
  end

  it 'sets a flash warning' do
    expect(flash[:warning]).to eq _('You are not permitted to visit this page')
  end
end
