
require 'rails_helper'

RSpec.describe "Api::V1::Medals", kind: :request do

  describe "GET /index" do    
    it 'must return 200 http status' do
        
        medal = create(:medal)
        get '/api/v1/medals'
        expect(response).to have_http_status(:ok)
      end
    
      it 'must return the current medal data' do
        
        create(:medal)

        get '/api/v1/medals'  
        
        expect(json_body[:data][0]).to have_key(:id)
        expect(json_body[:data][0]).to have_key(:kind)
        expect(json_body[:data][0]).to have_key(:competition)
        expect(json_body[:data][0]).to have_key(:created_at)
        expect(json_body[:data][0]).to have_key(:updated_at)

        expect(json_body[:data][0][:kind]).to eq('Silver' )
        expect(json_body[:data][0][:competition]).to eq('Skateboarding')      
      end
      
      describe "GET #show" do
      
      it "returns a 200 custom status code" do
        medal = create(:medal)
        get "/api/v1/medals/#{medal.id}"
        expect(response).to have_http_status(200)
        end

      it 'Judo Bronze Data' do
        medal = create(:medal, kind: 'Bronze', competition:  'Male Judo')
        get "/api/v1/medals/#{medal.id}"
        
        expect(json_body[:data][:kind]).to eq('Bronze')
        expect(json_body[:data][:competition]).to eq('Male Judo')
      end
      end

    describe "delete operations" do
  
      it "allow delete of medals" do
        medal = create(:medal)
        delete "/api/v1/medals/#{medal.id}"
        expect(response.status).to eq(200)          
     end
    end

     describe "update operation" do
  
      it "successfully updates a medal" do
         medal = create(:medal )
         body_data = { medal: { kind: 'Bronze', competition:  'Male Judo'} }
         put "/api/v1/medals/#{medal.id}", params: body_data
         expect(json_body[:message]).to eq ('Medalha atualizada')
         expect(response.status).to eq(200)        
       end
   end
  end
end