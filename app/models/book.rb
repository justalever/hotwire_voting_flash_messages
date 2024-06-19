class Book < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy

  has_many :voters, through: :votes, source: :user
end
