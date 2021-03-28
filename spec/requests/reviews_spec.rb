require 'google/cloud/datastore'
require 'rails_helper'
require 'json_web_token'

RSpec.describe 'Reviews', type: :request do
  let(:payload) { JSON.parse(response.body) }
  let(:user) { create(:user) }
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:gcp_datastore) { double }

  # TO DO: Find a way to improve this way to create a GCP Firestore entity
  let(:gcp_review_entity) do
    key = Google::Cloud::Datastore::Key.new('Review')
    key.id = 123
    properties = Google::Cloud::Datastore::Properties.new(title: 'example title', 
      content: 'example content', author: 1, product: { name: 'product' }.to_json)
    review_entity = Google::Cloud::Datastore::Entity.new
    review_entity.key = key
    review_entity.instance_variable_set('@properties', properties)
    
    review_entity
  end

  before { allow(Google::Cloud::Datastore).to receive(:new).and_return(gcp_datastore) }

  describe 'index' do
    context 'when the user is not authenticated' do
      before { get '/v1/reviews' }

      it 'responds with an unauthorized status code' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns an error message' do
        expect(payload['error']).to eq('Not authorized')
      end
    end

    context 'when the user is authenticated' do
      let(:reviews) { [gcp_review_entity] } 
  
      let(:expected_response) do
        [{
          'id' => 123, 'title' => 'example title', 'content' => 'example content', 
          'author' => 1, 'product' => { 'name' => 'product' }
        }]
      end
  
      before do
        allow(gcp_datastore).to receive(:query)
        allow(gcp_datastore).to receive(:run).and_return(reviews)
        get '/v1/reviews', headers: { 'Authorization' => token }
      end
  
      it 'responds with an ok status code' do
        expect(response).to have_http_status(:ok)
      end
  
      it 'returns the reviews data' do
        expect(payload).to eq(expected_response)
      end
    end
  end

  describe 'create' do
    context 'when the user is not authenticated' do
      before { post '/v1/reviews' }

      it 'responds with an unauthorized status code' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns an error message' do
        expect(payload['error']).to eq('Not authorized')
      end
    end

    context 'when the user is authenticated' do
      context "when the review's title is nil" do
        let(:params) do 
          { review: { content: 'example content', product: { name: 'product name' } } } 
        end

        before { post '/v1/reviews', params: params, headers: { 'Authorization' => token } }

        it 'responds with an unprocessable_entity status code' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'raises an error because title is nil' do
          expect(payload['error']).to eq('All attributes required')
        end
      end

      context "when the review's content is nil" do
        let(:params) { { review: { title: 'example title', product: { name: 'product name' } } } }

        before { post '/v1/reviews', params: params, headers: { 'Authorization' => token } }

        it 'responds with an unprocessable_entity status code' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'raises an error because content is nil' do
          expect(payload['error']).to eq('All attributes required')
        end
      end

      context "when the review's product is nil" do
        let(:params) { { review: { title: 'example title', content: 'example content' } } }

        before { post '/v1/reviews', params: params, headers: { 'Authorization' => token } }

        it 'responds with an unprocessable_entity status code' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'raises an error because product is nil' do
          expect(payload['error']).to eq('All attributes required')
        end
      end

      context 'when all the review params are sended' do
        let(:params) do
          { 
            review: { 
              title: 'example title', content: 'example content', 
              product: { name: 'example product' } 
            } 
          } 
        end

        let(:expected_response) do
          {
            'id' => 123, 'title' => 'example title', 'content' => 'example content', 
            'author' => 1, 'product' => { 'name' => 'product' }
          }
        end

        before do
          allow(gcp_datastore).to receive(:entity).and_return(gcp_review_entity)
          allow(gcp_datastore).to receive(:save)
          post '/v1/reviews', params: params, headers: { 'Authorization' => token }
        end

        it 'responds with a created status code' do
          expect(response).to have_http_status(:created)
        end

        it 'returns the view data' do
          expect(payload).to eq(expected_response)
        end
      end
    end
  end
end
