class Employment < ApplicationRecord
    validates :employeer, presence: true
    validates :date_started, presence: true
    validates :date_employment_ended, presence: true
    
    belongs_to :employee
end
