# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  SUPER_ADMIN = 'super-admin'.freeze
  SCHOOL_ADMIN = 'school-admin'.freeze
  STUDENT = 'student'.freeze
  # User associations
  has_many :enrollments, foreign_key: :student_id, dependent: :destroy
  has_many :batches, through: :enrollments, dependent: :destroy
  belongs_to :school, optional: true

  # User validations
  validates :role,:first_name, :last_name, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be a valid 10-digit phone number" }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  def super_admin?
    role == User::SUPER_ADMIN
  end

  def school_admin?
    role == User::SCHOOL_ADMIN
  end

  def student?
    role == User::STUDENT
  end
end
