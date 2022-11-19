require 'rails_helper'

RSpec.describe PersonalDataController, :type => :controller do
    describe "GET new" do

        it "request for new personal datum" do
            get :new
            expect(assigns(:personal_datum)).to be_a_new(PersonalDatum)
        end
    end

    context "POST create" do
        it " personal_datum with valid attributes" do
          post :create, :params => { :personal_datum => { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, nick_name: Faker::Name.name, email: Faker::Internet.email, phone: Faker::Base.numerify('###-###-####') } }
    
          expect(response.status).to eq(302)
        end
    
        it "raises an error if missing params email" do
            post :create, :params => { :personal_datum => { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, nick_name: Faker::Name.name, phone: Faker::Base.numerify('###-###-####') } }
            
            expect(response.status).to eq(422)
        end
    
      end
  end
  