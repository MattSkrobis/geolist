require 'rails_helper'

describe TasksController do
  render_views
  include_context 'user signed in'
  let(:list) { create(:list) }

  describe "#update" do
    let!(:task) { create(:task, title: "OurTask", list: list) }
    let(:call_request) { put :update, id: task.id, list_id: list.id, task: attributes }

    context 'valid request' do
      let(:attributes) { attributes_for(:task, title: "YourTask") }

      it { expect { call_request }.to change { task.reload.title }.from("OurTask").to("YourTask") }

      context 'after request' do
        before { call_request }

        it { should redirect_to user_profile_path }
        it { expect(controller.task).to eq task }
      end
    end

    context 'invalid request' do
      let(:attributes) { attributes_for(:task, title: nil) }

      it { expect { call_request }.not_to change { task.reload.title } }

      context 'after request' do
        before { call_request }

        it { expect(controller.task).to eq task }
      end
    end
  end
end
