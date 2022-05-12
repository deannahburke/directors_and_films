require 'rails_helper'

RSpec.describe Film do
  describe 'relationships', type: :model do
    it {should belong_to :director}
  end
end
