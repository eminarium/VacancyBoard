class Department < ApplicationRecord

  # VALIDATIONS
  validates :title, presence: true
end
