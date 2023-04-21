require 'rails_helper'

RSpec.describe HomeHelper, type: :helper do
  describe '#category_options' do
    it 'returns an array of category options' do
      expect(helper.category_options).to eq([["Sports", "sports"], ["Entertainment", 'entertainment'], ["Business", 'business'], ["Science", "science"], ["Technology", "technology"], ["Health", "health"]])
    end
  end

  describe '#country_options' do
    it 'returns an array of country options' do
      expect(helper.country_options).to eq([["India", "in"], ["USA", "us"], ["Japan", "jp"], ["UAE", "ae"]])
    end
  end

  describe '#language_options' do
    it 'returns an array of language options' do
      expect(helper.language_options).to eq([["English", "en"], ["Hindi", "hi"], ["Arabic", "ar"], ["Japanese", "ja"]])
    end
  end
end
