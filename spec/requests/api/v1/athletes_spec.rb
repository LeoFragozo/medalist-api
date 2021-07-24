
require 'rails_helper'

RSpec.describe "Api::V1::Athletes", type: :request do

  describe "GET /index" do    
    it 'must return 200 http status' do
        
        athlete = create(:athlete)
        get '/api/v1/athletes'
        expect(response).to have_http_status(:ok)
      end
    
      it 'must return the current athlete data' do
        
        create(:athlete)

        get '/api/v1/athletes'  
        
        expect(json_body[:data][0]).to have_key(:id)
        expect(json_body[:data][0]).to have_key(:name)
        expect(json_body[:data][0]).to have_key(:gender)
        expect(json_body[:data][0]).to have_key(:country)
        expect(json_body[:data][0]).to have_key(:created_at)
        expect(json_body[:data][0]).to have_key(:updated_at)

        expect(json_body[:data][0][:name]).to eq('Lucarelli' )
        expect(json_body[:data][0][:gender]).to eq('Male' )
        expect(json_body[:data][0][:country]).to eq('Brazil' )      
      end
      
      describe "GET #show" do
      
      it "returns a 200 custom status code" do
        athlete = create(:athlete)
        get "/api/v1/athletes/#{athlete.id}"
        expect(response).to have_http_status(200)
        end

      it 'must return Naomi Osaka data' do
        athlete = create(:athlete, name: 'Naomi Osaka', gender:  'Female', country: 'Japan' )
        get "/api/v1/athletes/#{athlete.id}"
        
        expect(json_body[:data][:name]).to eq('Naomi Osaka')
        expect(json_body[:data][:gender]).to eq('Female')
        expect(json_body[:data][:country]).to eq('Japan')
      end
      end

    describe "delete operations" do
  
      it "allow delete of athletes" do
        athlete = create(:athlete)
        delete "/api/v1/athletes/#{athlete.id}"
        expect(response.status).to eq(200)          
     end
    end

     describe "update operation" do
  
      it "successfully updates a athlete" do
         athlete = create(:athlete )
         body_data = { athlete: { name: 'Naomi Osaka', gender:  'Female', country: 'Japan'} }
         put "/api/v1/athletes/#{athlete.id}", params: body_data
         expect(json_body[:message]).to eq ('Atleta atualizado')
         expect(response.status).to eq(200)        
       end
   end
  end
end