class DogWalking < ApplicationRecord
  has_many :dogs, dependent: :destroy
  accepts_nested_attributes_for :dogs
end
