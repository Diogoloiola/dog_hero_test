class DogWalking < ApplicationRecord
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
    self.price = Values::PriceService.new(duration, dogs.size).call
  end

  def count_dogs
    @size_dogs = DogWalking.find(id).dogs.size
  end

  def new_dogs_added?
    return if @size_dogs.nil?
    return if dogs.size == @size_dogs

    self.price = Values::PriceService.new(duration, dogs.size - @size_dogs, price:,
                                                                            operation: 'add_new_dogs').call
  end
end
