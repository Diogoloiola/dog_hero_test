class DogWalking < ApplicationRecord
  PRICE_WITH_30_MINUTES = 25
  PRICE_WITH_60_MINUTES = 35

  attr_accessor :size_dogs

  has_many :dogs, dependent: :destroy
  accepts_nested_attributes_for :dogs

  validate :valid_duration?

  before_save :set_price, if: -> { price.nil? }
  before_save :count_dogs, unless: -> { id.nil? }
  before_save :new_dogs_added?

  private

  def valid_duration?
    return if duration == 30 || duration == 60

    errors.add(:base, 'A duração informada é inválida')
  end

  def set_price
    case duration
    when 30
      self.price = PRICE_WITH_30_MINUTES * dogs.size
    when 60
      self.price = PRICE_WITH_60_MINUTES * dogs.size
    end
  end

  def count_dogs
    @size_dogs = DogWalking.find(id).dogs.size
  end

  def new_dogs_added?
    return if @size_dogs.nil?
    return if dogs.size == @size_dogs

    case duration
    when 30
      self.price = price + (PRICE_WITH_30_MINUTES - 10) * (dogs.size - @size_dogs)
    when 60
      self.price = price + (PRICE_WITH_60_MINUTES - 15) * (dogs.size - @size_dogs)
    end
  end
end
