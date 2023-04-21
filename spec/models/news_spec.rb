require 'rails_helper'

RSpec.describe News, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :slug }
    it { is_expected.to validate_presence_of :url }
    it { is_expected.to validate_presence_of :language }
    it { is_expected.to validate_presence_of :countries }
    it { is_expected.to validate_presence_of :categories }
  end
end
