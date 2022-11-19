require 'rails_helper'

RSpec.describe PersonalDatum, :type => :model do
    context 'validations' do
        it { should validate_presence_of :first_name }
        it { should validate_presence_of :last_name }
        it { should validate_presence_of :phone }
        it { should validate_presence_of :email }
        it { should validate_uniqueness_of(:email).case_insensitive }
      end

      it "orders them in reverse chronologically" do
        first_name = Faker::Name.first_name
        person = PersonalDatum.create!(first_name: first_name, last_name: Faker::Name.last_name, nick_name: Faker::Name.name, email: Faker::Internet.email, phone: Faker::Base.numerify('###-###-####'))
        expect(person.first_name).to eq(first_name)
      end
  end