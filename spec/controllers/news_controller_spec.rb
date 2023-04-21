require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  describe '#index' do
    let!(:news) { create_list(:news, 5) }

    it 'assigns @news with all news' do
      get :index
      expect(assigns(:news)).to match_array(news)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe '#show' do
    let!(:news) { create(:news) }

    it 'assigns @news with the correct news' do
      get :show, params: { id: news.id }
      expect(assigns(:news)).to eq(news)
    end

    it 'renders the show template' do
      get :show, params: { id: news.id }
      expect(response).to render_template(:show)
    end
  end

  describe '#create' do
    let(:valid_params) { attributes_for(:news) }
    let(:invalid_params) { { title: '' } }

    context 'with valid params' do
      it 'creates a new news' do
        expect {
          post :create, params: { news: valid_params }
        }.to change(News, :count).by(1)
      end

      it 'sets the success flash message' do
        post :create, params: { news: valid_params }
        expect(flash[:success]).to eq('News is added your watch later list.')
      end

      it 'redirects to the index page' do
        post :create, params: { news: valid_params }
        expect(response).to redirect_to(news_index_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new news' do
        expect {
          post :create, params: { news: invalid_params }
        }.not_to change(News, :count)
      end

      it 'sets the danger flash message' do
        post :create, params: { news: invalid_params }
        expect(flash[:danger]).to eq('Something went wrong.')
      end
    end
  end
end
