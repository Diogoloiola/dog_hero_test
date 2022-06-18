module Values
  class PriceService

    PRICE_WITH_30_MINUTES = 25
    PRICE_WITH_60_MINUTES = 35

    def initialize(duration, size, price: 0, operation: 'set_price')
      @duration = duration
      @size = size
      @price = price
      @operation = operation
    end

    def call
      case @operation
      when 'set_price'
        calculate_price_for_new_walking
      when 'add_new_dogs'
        calculate_price_for_new_dogs
      else
        raise 'INVALID OPTION'
      end
    end

    private

    def calculate_price_for_new_walking
      fetch_value * @size
    end

    def calculate_price_for_new_dogs
      @price + fetch_value
    end

    def fetch_value
      case @operation
      when 'set_price'
        @duration == 30 ? PRICE_WITH_30_MINUTES : PRICE_WITH_60_MINUTES
      when 'add_new_dogs'
        @duration == 30 ? (PRICE_WITH_30_MINUTES - 10) * @size : (PRICE_WITH_60_MINUTES - 15) * @size
      end
    end
  end
end
