require 'rails_helper'

RSpec.describe 'Developers API', type: :request do
  # initialize test data 
  let!(:categories) { create_list(:category, 5) }
  let!(:developers) { create_list(:developer, 10) }
  let(:developer_id) { developers.first.id }
  let(:category_id) { categories.first.id }


  # Test suite for GET /developers
  describe 'GET /developers' do
    # make HTTP get request before each example
    before { get '/developers' }

    it 'returns developers' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
    #   expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /developers/:id
  describe 'GET /developers/:id' do
    before { get "/developers/#{developer_id}" }

    context 'when the record exists' do
      it 'returns the developer' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(developer_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:developer_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Developer with 'id'=100/)
      end
    end
  end

  # Test suite for POST /developers
  describe 'POST /developers' do
    # valid payload
    let(:valid_attributes) { 
        { 
            first_name: 'Seun', 
            last_name: 'Osewa', 
            email: 'seunosewa@gmail.com', 
            github_username: 'seunosewa2018', 
            phone_number: '08071334455', 
            website: 'www.nairaland.com', 
            country: 'Nigeria',
            category_id: 1
        } 
    }

    context 'when the request is valid' do
      before { post '/developers', params: valid_attributes }

      it 'creates a developer' do
        expect(json['first_name']).to eq('Seun')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/developers', params: 
                { 
                    first_name: 'Seun', 
                    email: 'seunosewa@gmail.com', 
                    github_username: 'seunosewa2018', 
                    phone_number: '08071334455', 
                    website: 'www.nairaland.com', 
                    country: 'Nigeria',
                    category_id: 1
                }  
            }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Last name can't be blank/)
      end
    end
  end

  # Test suite for PUT /developers/:id
  describe 'PUT /developers/:id' do
    let(:valid_attributes) { { first_name: 'Sade' } }

    context 'when the record exists' do
      before { put "/developers/#{developer_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /developers/:id
  describe 'DELETE /developers/:id' do
    before { delete "/developers/#{developer_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end