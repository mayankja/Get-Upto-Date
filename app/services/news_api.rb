require 'uri'
require 'net/http'
require 'openssl'

class NewsApi
  # This endpoint will fetch news on basic of country, category and language.
  attr_accessor :country, :category, :language

  def initialize(options={})
    @country = options['country'] || 'us'
    @category = options['category'] || 'sports'
    @language = options['language'] || 'en'
  end

  def get_news
    response = perform_http(url)

    if response[:status] == 'success'
      response[:results]
    else
      # we can handle failure but leaving for the moment
      []
    end
  end


  private

  # Performing http request GET request to fetch news from different resources
  def http
    @http ||= begin
      http = Net::HTTP.new(ENV['RAPID_API_HOST'], 443)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http
    end
  end

  def perform_http(url)
    url = URI(url)
    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = ENV['RAPID_API_KEY']
    request["X-RapidAPI-Host"] = ENV['RAPID_API_HOST']
    response = http.request(request)
    if valid_json?(response.body)
      JSON.parse(response.body).with_indifferent_access
    else
      { status: 'error', message: 'Unexpected response from news api.' }
    end
  rescue StandardError => e
    { status: 'error', message: e.message }
  end

  def params
    params = {
      category: category,
      country: country,
      language: language
    }
  end

  def url
    URI::HTTPS.build(host: ENV['RAPID_API_HOST'], path: '/sources', query: URI.encode_www_form(params))
  end

  def endpoint
    "https://#{ENV['RAPID_API_HOST']}/sources"
  end

  def valid_json?(response_body)
    begin
      !!JSON.parse(response_body)
    rescue JSON::ParserError
      false
    end
  end
end
