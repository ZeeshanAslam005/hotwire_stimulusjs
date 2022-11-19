require 'rails_helper'

RSpec.describe EmployeesController, :type => :controller do
    describe "GET index" do
        it "request for new employee" do
            get :new
            expect(assigns(:employment)).to be_a_new(Employment)
        end
    end

    context "POST create" do
        it " employment with valid attributes" do
          # post_via_redirect '/carts', :cart => {:line_items_attributes=>{'0'=>{'quantity'=>2, 'other_attr'=>"value"}}}

          post :create, :params => { :employee => { :employments_attributes => {
            '0' => {
            employeer: Faker::Name.unique.name,
            date_started: Faker::Date.between_except(from: 10.year.ago, to: 1.year.from_now, excepted: Date.today),
            date_employment_ended: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today)
               }   }
              }
            }
    
          expect(response.status).to eq(302)
        end
    
        it "raises an error if missing params email" do
          post :create, :params => { :employee => { :employments_attributes => {
            '0' => {
            employeer: Faker::Name.unique.name,
            date_employment_ended: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today)
               }   }
              }
            }
            expect(response.status).to eq(422)
        end
    
      end
  end
  