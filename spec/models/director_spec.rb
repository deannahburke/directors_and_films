require 'rails_helper'

RSpec.describe Director do
  describe 'relationships', type: :model do 
    it {should have_many :films}
  end
end
