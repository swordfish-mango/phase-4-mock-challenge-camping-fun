class Signup < ApplicationRecord
    belongs_to :activity
    belongs_to :camper

    validates :time, presence: true
    validate :valid_time

    def valid_time
        if time
            errors.add(:time,"Time be between 0 and 23") unless
                time >= 0 && time <= 23
        else
            errors.add(:time, "Time required")
        end
    end
end
