RSpec.shared_context "github_mock_api" do
  let(:stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/search/repositories?per_page=10&q=') do
        [
          422,
          { 'Content-Type': 'application/json' },
          {}
        ]
      end

      stub.get('/search/repositories?per_page=10&q=ruby') do
        [
          200,
          { 'Content-Type': 'application/json' },
          file_fixture("ruby_per_page_10.json").read
        ]
      end
    end
  end
  let(:connection) do
    Faraday.new do |b|
      b.adapter(:test, stubs)
      b.response :json
      b.use Faraday::Response::RaiseError
    end
  end

  subject { Github::Search::Repository }

  before do
    allow_any_instance_of(Github::Connection).to receive(:connection).and_return(connection)
  end
end
