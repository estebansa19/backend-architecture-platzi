require 'rails_helper'
require 'json_web_token'

RSpec.describe 'Authenticate', type: :request do
  let(:user) { create(:user) }
  let(:payload) { JSON.parse(response.body) }
  let(:expected_token) { 'the-game' }

  context 'when a valid email and password are sended' do
    before do 
      allow(JsonWebToken).to receive(:encode).and_return(expected_token)
      post '/v1/authenticate', params: { email: user.email, password: user.password }
    end

    it 'responds with a ok status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the authentication token' do
      expect(payload['auth_token']).to eq(expected_token)  
    end
  end

  context 'when an invalid email or password are sended' do
    before { post '/v1/authenticate', params: { email: 'sample text', password: 'sample text' } }

    it 'responds with an unauthorized status code' do
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns an error message' do
      expect(payload['error']).to eq('Invalid credentials')
    end
  end
end
