RSpec.describe "Get /api/articles", type: :request do
  #ARRANGE
  let!(:aricles) { create_list(:article, 5) }

  before do
    # ACT
    get "/api/articles"
  end

  subject { response }
  # ASSERT
  it "is expected to respond with status code 200" do
    expect(subject.status).to eq 200
  end
#上下是一个测试的两种不同形式
  it { is_expected.to have_http_status 200 }
  
  it "is expected to return a collection of 5 articles" do
    expect(response_json["articles"].size).to eq 5
  end
end
