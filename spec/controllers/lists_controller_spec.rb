require 'rails_helper'

describe ListsController do
  render_views
  include_context 'user signed in'

  describe '#new' do
    let(:call_request) { get :new, user_id: user.id }

    context 'after request' do
      before { call_request }

      it { expect(assigns(:list).persisted?).to be false }
      it { should render_template 'new' }
    end
  end

  describe '#index' do
    let(:call_request) { get :index, user_id: user.id }
    let!(:list) { create(:list, user: user) }

    context 'after request' do
      before { call_request }

      it { should render_template 'index' }
      it { expect(assigns(:lists)).to eq [list] }
    end
  end

  describe "#edit" do
    let(:call_request) { get :edit, id: list.id, user_id: user.id }
    let(:list) { create(:list, user: user) }

    context 'after request' do
      before { call_request }

      it { should render_template 'edit' }
      it { expect(assigns(:list)).to eq list }
    end
  end

  describe "#show" do
    let(:call_request) { get :show, id: list.id, user_id: user.id }
    let(:list) { create(:list, user: user) }

    context 'after request' do
      before { call_request }

      it { should render_template 'show' }
      it { expect(assigns(:list)).to eq list }
    end
  end

  describe "#destroy" do
    let!(:list) { create(:list, user: user) }
    let(:call_request) { delete :destroy, id: list.id, user_id: user.id }

    it { expect { call_request }.to change { List.count }.by(-1) }

    context 'after request' do
      before { call_request }

      it { should redirect_to user_lists_path(user) }
    end
  end

  describe "#update" do
    let!(:list) { create(:list, name: "MyList", user: user) }
    let(:call_request) { put :update, id: list.id, user_id: user.id, list: attributes }

    context 'valid request' do
      let(:attributes) { attributes_for(:list, name: "YourList") }

      it { expect { call_request }.to change { list.reload.name }.from("MyList").to("YourList") }

      context 'after request' do
        before { call_request }

        it { should redirect_to user_list_path(user, list) }
        it { expect(assigns(:list)).to eq list }
      end
    end

    context 'invalid request' do
      let(:attributes) { attributes_for(:list, name: nil) }

      it { expect { call_request }.not_to change { list.reload.name } }

      context 'after request' do
        before { call_request }

        it { should render_template 'edit' }
        it { expect(assigns(:list)).to eq list }
      end
    end
  end

  describe "#create" do
    let(:call_request) { post :create, list: attributes, user_id: user.id }

    context 'valid request' do
      let(:attributes) { attributes_for(:list, name: 'List') }

      it { expect { call_request }.to change { List.count }.by(1) }

      context 'after request' do
        before { call_request }
        let(:created_list) { List.last }

        it { should redirect_to user_list_path(user, created_list) }
      end
    end

    context 'invalid request' do
      let(:attributes) { attributes_for(:list, name: nil) }

      it { expect { call_request }.not_to change { List.count } }

      context 'after request' do
        before { call_request }

        it {should render_template 'new'}
      end
    end
  end
end
