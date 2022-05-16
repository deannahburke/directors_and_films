require 'rails_helper'

RSpec.describe Film, type: :model do
  describe 'relationships' do
    it {should belong_to :director}
  end
  describe 'validations' do
    it { should validate_presence_of :title}
    it { should validate_presence_of :oscar_wins}
    it { should validate_presence_of :budget}
    it { should validate_presence_of :revenue}
    it { should validate_presence_of :release_date}
    it { should allow_value(true).for(:oscar_nominated) }
    it { should allow_value(false).for(:oscar_nominated) }
  end
end
