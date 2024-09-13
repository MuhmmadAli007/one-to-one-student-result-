class Result < ApplicationRecord
  belongs_to :student
  validates :marks,presence: true

end
