require 'rails_helper'

RSpec.describe NewsApi do
  describe '#get_news' do
    let(:news_api) { described_class.new(country: 'us', category: 'sports', language: 'en') }

    context 'when the request is successful' do
      let(:expected_news) do
        [
          {
            "title": "Some news title",
            "description": "Some news description",
            "url": "https://example.com/news",
            "language": ["Hindi", "English"],
            "country": ["India"],
            "category": ["Sports", "Entertainment"],

          }
        ]
      end

      before do
        stub_request(:get, news_api.send(:url))
          .with(headers: {
            'X-RapidAPI-Key' => ENV['RAPID_API_KEY'],
            'X-RapidAPI-Host' => ENV['RAPID_API_HOST']
          })
          .to_return(body: { status: 'success', results: expected_news }.to_json)
      end

      it 'returns the expected news' do
        expect(news_api.get_news).to eq(expected_news)
      end
    end

    context 'when the request is not successful' do
      before do
        stub_request(:get, news_api.send(:url))
          .with(headers: {
            'X-RapidAPI-Key' => ENV['RAPID_API_KEY'],
            'X-RapidAPI-Host' => ENV['RAPID_API_HOST']
          })
          .to_return(body: { status: 'error', message: 'Unexpected response from news api.' }.to_json)
      end

      it 'returns an empty array' do
        expect(news_api.get_news).to eq([])
      end
    end

    context 'when there is an error during the request' do
      before do
        allow(news_api).to receive(:perform_http).and_raise(StandardError.new('An error occurred'))
      end

      it 'returns an empty array' do
        expect(news_api.get_news).to eq([])
      end
    end
  end
end
