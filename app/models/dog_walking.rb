class DogWalking < ApplicationRecord
  PRICE_WITH_30_MINUTES = 25
  PRICE_WITH_60_MINUTES = 35

  has_many :dogs, dependent: :destroy
  accepts_nested_attributes_for :dogs

  validate :valid_duration?

  before_save :set_price

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
      self.price = PRICE_WITH_30_MINUTES * dogs.size
    end
  end
end
