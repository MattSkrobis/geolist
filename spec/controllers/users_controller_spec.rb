require 'rails_helper'

describe UsersController do
  render_views
  include_context 'user signed in'

  describe '#show' do
    let(:call_request) { get :show, id: user.id }
    let(:user) { create(:user) }

    context 'after request' do
      before { call_request }

      it { should render_template 'show' }
      it { expect(assigns(:user)).to eq user }
    end
  end
end

