class Student < ApplicationRecord
  has_one :result ,dependent: :destroy

end
