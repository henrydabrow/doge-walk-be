# frozen_string_literal: true

class RefreshToken < ApplicationRecord
  belongs_to :user

  validates_presence_of :crypted_token
  validates_uniqueness_of :crypted_token
end
