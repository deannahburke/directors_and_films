require 'rails_helper'

RSpec.describe Film do
  describe 'relationships' do
    it {should belong_to :director}
  end
end
