class Dojo < ApplicationRecord
    validates :branch, :street, :city, :state, presence: true
    has_many :students
end
