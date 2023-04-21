class News < ApplicationRecord
  validates :title, :description, :url, :language, :categories, :countries, :slug, presence: true
end
