class HomeController < ApplicationController
  def index
    @news ||= NewsApi.new(filter_params).get_news
  end

  private

  def filter_params
    params.permit(:category, :country, :language)
  end
end
