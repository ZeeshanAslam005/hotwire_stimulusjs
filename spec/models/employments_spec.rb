require 'rails_helper'

RSpec.describe Employment, :type => :model do
    context 'associations' do
        it { should validate_presence_of :employeer }
        it { should validate_presence_of :date_started }
        it { should validate_presence_of :date_employment_ended }
      end
  end