# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :pets, dependent: :destroy
  has_one :refresh_token, dependent: :destroy

  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :password,
            length: { minimum: 8 },
            format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W)[A-Za-z\d\W]{8,}\z/,
                      message: "must contain capital letter, number and special character" },
            allow_blank: true
end
