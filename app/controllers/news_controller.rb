class NewsController < ApplicationController
  def index
    @news ||= News.all
  end

  def show
    @news = News.find(params[:id])
  end

  def create
    @news = News.new(news_params)
    if @news.save
      flash[:success] = "News is added your watch later list."
      redirect_to news_index_path
    else
      flash[:danger] = "Something went wrong."
    end
  end

  private

  def filter_params
    @filter_params ||= params.permit(:category, :country, :language)
  end

  def news_params
    @news_params ||= params.permit(:title, :description, :url, :slug)
  end

  def attributes
    news_params.merge(
      language: params[:language].split(","),
      categories: params[:categories].split(","),
      countries: params[:countries].split(",")
    )
  end
end
