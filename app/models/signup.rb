class Signup < ApplicationRecord

    belongs_to :camper 
    belongs_to :activity 

    validates :time, numericality: { less_than_or_equal_to: 23 }
end
