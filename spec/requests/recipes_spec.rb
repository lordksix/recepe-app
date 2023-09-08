require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  pending describe 'GET /index' do
    it 'returns http success' do
      get '/recipes/index'
      expect(response).to have_http_status(:success)
    end
  end

  pending describe 'GET /show' do
    it 'returns http success' do
      get '/recipes/show'
      expect(response).to have_http_status(:success)
    end
  end

  pending describe 'GET /destroy' do
    it 'returns http success' do
      get '/recipes/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
