require 'rails_helper'

describe ListsController do
  render_views
  include_context 'user signed in'

  describe "#show" do
    let(:call_request) { get :show, id: list.id, user_id: user.id }
    let(:list) { create(:list, user: user) }

    context 'after request' do
      before { call_request }

      it { should render_template 'show' }
      it { expect(controller.list).to eq list }
    end
  end

  describe '#index' do
    let(:call_request) { get :index, user_id: user.id }
    let!(:list) { create(:list, user: user) }

    context 'after request' do
      before { call_request }

      it { should render_template 'index' }
      it { expect(controller.lists).to eq [list] }
    end
  end
end
