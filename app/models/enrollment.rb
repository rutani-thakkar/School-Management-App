# frozen_string_literal: true

class Enrollment < ApplicationRecord
  # Enrollment associations
  belongs_to :student, class_name: 'User'
  belongs_to :batch

  #Enrollment  validations
  validates :status, presence: true
  enum status: { Requested: 0, Accepted: 1, Denied: 2 }

end
