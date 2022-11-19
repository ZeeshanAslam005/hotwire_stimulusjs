class PersonalDatum < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :phone, presence: true
    validates :phone,   :presence => {:message => 'Phone number invalid'},
                        :length => { :minimum => 12, :maximum => 12 }

    validates_length_of :first_name, maximum: 25
    validates_length_of :last_name, maximum: 50

end
