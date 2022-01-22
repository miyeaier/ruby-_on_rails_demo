RSpec.describe 'GET /api/articles' do
  describe 'successfully' do
    let!(:articles) {3.times{ create(:article)}}
    before do
      get '/api/articles'
    end

    it 'is expected to return a 200 response status' do
      expect(response).to have_http_status 200
    end
       
    it 'is expected to return all articles' do
      expect(JSON.parse(response.body)['articles'].count).to eq 3
    end

    it 'is expected to return articles titles' do
      expect(JSON.parse(response.body)['articles'].first['title']).to eq 'This is an awesome title'
    end
  end
end
