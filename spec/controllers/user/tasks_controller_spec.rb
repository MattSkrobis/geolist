require 'rails_helper'

describe User::TasksController do
  render_views
  include_context 'user signed in'
  let(:list) { create(:list) }

  before(:each) do
    request.env["HTTP_REFERER"] = "back"
  end

  describe "#edit" do
    let(:call_request) { get :edit, id: task.id, list_id: list.id }
    let(:task) { create(:task, list: list) }

    context 'after request' do
      before { call_request }

      it { should render_template 'edit' }
      it { expect(controller.task).to eq task }
    end
  end

  describe "#destroy" do
    let!(:task) { create(:task, list: list) }
    let(:call_request) { delete :destroy, id: task.id, list_id: list.id }

    it { expect { call_request }.to change { Task.count }.by(-1) }

    context 'after request' do
      before { call_request }

      it { should redirect_to user_list_path(list) }
    end
  end

  describe "#update" do
    let!(:task) { create(:task, title: "OurTask", list: list) }
    let(:call_request) { put :update, id: task.id, list_id: list.id, task: attributes }

    context 'valid request' do
      let(:attributes) { attributes_for(:task, title: "YourTask") }

      it { expect { call_request }.to change { task.reload.title }.from("OurTask").to("YourTask") }

      context 'after request' do
        before { call_request }

        it { should redirect_to user_list_path(list) }
        it { expect(controller.task).to eq task }
      end
    end

    context 'invalid request' do
      let(:attributes) { attributes_for(:task, title: nil) }

      it { expect { call_request }.not_to change { task.reload.title } }

      context 'after request' do
        before { call_request }

        it { should redirect_to 'back' }
        it { expect(controller.task).to eq task }
      end
    end
  end

  describe "#create" do
    let(:call_request) { post :create, task: attributes, list_id: list.id }

    context 'valid request' do
      let(:attributes) { attributes_for(:task, title: 'Task1') }

      it { expect { call_request }.to change { Task.count }.by(1) }

      context 'after request' do
        before { call_request }

        it { should redirect_to user_list_path(list) }
      end
    end

    context 'invalid request' do
      let(:attributes) { attributes_for(:task, title: nil) }

      it { expect { call_request }.not_to change { Task.count } }

      context 'after request' do
        before { call_request }

        it { should redirect_to 'back' }
      end
    end
  end
end
