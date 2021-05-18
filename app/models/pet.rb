# frozen_string_literal: true

class Pet < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :user_id

  has_one_attached :image

  validates_presence_of :name
  validates_presence_of :kind

  enum kind: {
    cat: 0,
    dog: 1,
  }
end
