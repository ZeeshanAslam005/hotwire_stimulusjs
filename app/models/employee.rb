class Employee < ApplicationRecord
    has_many :employments
    accepts_nested_attributes_for :employments, reject_if: :all_blank, allow_destroy: true
end
