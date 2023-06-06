# frozen_string_literal: true

class Course < ApplicationRecord
  # Course associations
  belongs_to :school
  has_many :batches, dependent: :destroy

  # Course validations
  validates :name,:description, :duration, :start_date, :end_date, presence: true
end
