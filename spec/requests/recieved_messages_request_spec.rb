# frozen_string_literal: true

RSpec.describe 'Recieved_Messages', type: :request do
  # initialize test data
  let!(:user) { create(:user) }
  let!(:message) { create(:message) }

  describe 'new user session' do
    context 'with valid request' do
      before { login }

      it 'should sign in user' do
        expect(json['data']['email']).to eq(user.email)
      end

      it 'should return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with invalid request' do
      before { login(email: 'wrong@email.com') }

      it 'should return a validation failure message' do
        expect(response.body).to include(
          I18n.t('errors.invalid_login_credentials')
        )
      end
    end
  end

  describe 'Sent Messages' do
    context 'with valid request' do
      before do
        login
        @auth_params = get_auth_params_from_login_response_headers(response)
      end

      it 'should get all messages sent to the user' do
        get '/api/v1/recieved_messages', headers: @auth_params
        expect(json.size).to eq(0)
      end

      it 'should notify user' do
        create_recieved_message
        expect(response).to have_http_status(201)
      end

      it 'should fetch recieved_message' do
        recieved_message = create_recieved_message
        get api_v1_recieved_message_path(recieved_message), headers: @auth_params
        expect(json['id']).to eq(recieved_message.id)
      end

      it 'should destroy recieved_message' do
        recieved_message = create_recieved_message
        delete api_v1_recieved_message_path(recieved_message), headers: @auth_params
        expect(response).to have_http_status(204)
      end
    end
  end

  private

  def get_auth_params_from_login_response_headers(response)
    response.headers.slice(
      'client',
      'access-token',
      'uid',
      'expiry',
      'token-type'
    )
  end

  def login(email: nil)
    post api_v1_user_session_path, params: { email: (email || user.email), password: 112_233 }.to_json,
                                   headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  end

  def create_recieved_message
    post api_v1_recieved_messages_path, headers: @auth_params,
                                        params: recieved_message_attributes(user.id, message.id)
    response.status == 201 ? RecievedMessage.first : nil
  end
end
