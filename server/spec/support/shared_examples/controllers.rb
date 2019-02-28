# frozen_string_literal: true

RSpec.shared_examples 'a successfull page render' do |template_to_be_rendered|
  it 'returns http success' do
    expect(response).to have_http_status(:success)
  end

  it "renders the #{template_to_be_rendered} template" do
    expect(response).to render_template(template_to_be_rendered)
  end
end

RSpec.shared_examples 'changes successfully saved' do
  it 'sets a flash now success' do
    expect(flash.now[:success]).to eq _('Your changes have been saved')
  end
end

RSpec.shared_examples 'unpermitted' do
  it 'redirects to root' do
    expect(response).to redirect_to(:root)
  end

  it 'sets a flash message' do
    expect(flash[:warning]).to eq _('You are not permitted to visit this page')
  end
end
