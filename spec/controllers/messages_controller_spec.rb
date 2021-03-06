require 'rails_helper'

describe MessagesController do
  let(:group) { create(:group) }
  let(:user) { create(:user) }

  describe '#index' do

    context 'log in' do
      before do
        login user
        get :index, params: { group_id: group.id }
      end

      it 'assigns @message' do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it 'assigns @group' do
        expect(assigns(:group)).to eq group
      end

      it 'render index' do
        expect(response).to render_template :index
      end
    end

    context 'not log in' do
      before do
        get :index, params: { group_id: group.id }
      end

      it 'redirect to new_user_session_path' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe '#create' do
    let(:params) {{ group_id: group.id, user_id: user.id, message: attributes_for(:message) }}

    context 'log in' do
      before do
        login user
      end

      context 'can save' do
        subject {
          post :create,
          params: params
        }

        it 'count up message' do
          expect{ subject }.to change(Message, :count).by(1)
        end

        it 'redirect to group_messages_path' do
          subject
          expect(response).to redirect_to group_messages_path(group)
        end
      end

      context 'can not save' do
        let(:invalid_params) {{ group_id: group.id, user_id: user.id, message: attributes_for(:message, body: nil, image: nil) }}

        subject {
          post :create,
          params: invalid_params
        }

        it 'does not count up messages' do
          expect{ subject }.to change(Message, :count).by(0)
        end

        it 'renders index' do
          subject
          expect(response).to render_template :index
        end
      end
    end

    context 'not log in' do
      subject {
        post :create,
        params: params
      }
      it 'redirect to log in page' do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end