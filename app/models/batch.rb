# frozen_string_literal: true

class Batch < ApplicationRecord
  # Batch associations
  belongs_to :course
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments, dependent: :destroy

  # Batch validations
  validates :name,:capacity, :description, :start_date, :end_date, presence: true
end
