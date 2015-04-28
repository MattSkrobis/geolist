require 'rails_helper'

describe ProfileController do
  render_views
  include_context 'user signed in'

  describe '#edit' do
    let(:call_request) { get :edit, id: user.id }
    let(:user) { create(:user) }

    context 'after request' do
      before { call_request }

      it { should render_template 'edit' }
      it { expect(controller.profile).to eq user }
    end
  end

  describe '#update' do
    let(:call_request) { put :update, id: user.id, user: attributes }
    let!(:user) { create(:user, first_name: 'Clark', last_name: 'Wayne') }

    context 'valid request' do
      let(:attributes) { attributes_for(:user, first_name: 'Bruce', last_name: 'Kent') }

      it { expect { call_request }.to change { user.reload.first_name }.from('Clark').to('Bruce') }
      it { expect { call_request }.to change { user.reload.last_name }.from('Wayne').to('Kent') }

      context 'after request' do
        before { call_request }

        it { should redirect_to profile_path }
        it { expect(controller.profile).to eq user }
      end
    end
    context 'invalid request' do
      let(:attributes) { attributes_for(:user, first_name: nil, last_name: nil) }

      it { expect { call_request }.not_to change { user.reload.first_name } }
      it { expect { call_request }.not_to change { user.reload.last_name } }
    end
  end

  describe '#show' do
    let(:call_request) { get :show, id: user.id }
    let(:user) { create(:user) }

    context 'after request' do
      before { call_request }

      it { should render_template 'show' }
      it { expect(controller.profile).to eq user }
    end
  end
end
