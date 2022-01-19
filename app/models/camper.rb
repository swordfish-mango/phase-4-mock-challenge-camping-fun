class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups


    validates :name, presence: true
    validates :age, presence: true
    validate :age_must_be_between_8_and_18

    def age_must_be_between_8_and_18
        errors.add(:age,"Must be between 8 and 18") unless
            age >= 8 && age <= 18
    end
end
