require 'rails_helper'

RSpec.describe Employee, :type => :model do
    context 'associations' do
        it { should have_many(:employments) }
      end
  end