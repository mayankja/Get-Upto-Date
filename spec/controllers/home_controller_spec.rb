require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '#index' do
    let(:news_api) { instance_double('NewsApi') }
    let(:filter_params) { { category: 'business', country: 'us', language: 'en' } }

    before do
      allow(NewsApi).to receive(:new).with(filter_params).and_return(news_api)
      allow(news_api).to receive(:get_news)
    end

    it 'assigns @news with the result of NewsApi#get_news' do
      expect(news_api).to receive(:get_news)
      get :index, params: filter_params
      expect(assigns(:news)).to eq(news_api.get_news)
    end

    it 'calls permit on params with the expected parameters' do
      expect(filter_params).to receive(:permit).with(:category, :country, :language)
      get :index, params: filter_params
    end

    it 'renders the index template' do
      get :index, params: filter_params
      expect(response).to render_template(:index)
    end
  end
end
