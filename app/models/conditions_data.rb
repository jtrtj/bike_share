class ConditionsData
  attr_reader :relevant_query

  def initialize(relevant_query)
    @relevant_query = relevant_query
  end

  def all_rides_by_temp_range(all_ranges)
    all_rides = {}
    all_ranges.step(10) do |range|
      all_rides[range] = [most_rides_in_temp_range(range), least_rides_in_temp_range(range), average_rides_in_temp_range(range)]
    end
    all_rides
  end

  def most_rides_in_temp_range(temp_range)
    by_tens = {}
    @relevant_query.select do |key, value|
      if key[1] >= temp_range && key[1] <= temp_range + 10
        by_tens[key] = value
      end
    end
    most_rides_max_temp_val = by_tens.values.max
    {most_rides_max_temp_val => by_tens.invert[most_rides_max_temp_val]}
  end

  def least_rides_in_temp_range(temp_range)
    by_tens = {}
    @relevant_query.select do |key, value|
      if key[1] >= temp_range && key[1] <= temp_range + 10
        by_tens[key] = value
      end
    end
    least_rides_max_temp_val = by_tens.values.min
    {least_rides_max_temp_val => by_tens.invert[least_rides_max_temp_val]}
  end

  def average_rides_in_temp_range(temp_range)
    by_tens = []
    @relevant_query.select do |key, value|
      if key[1] >= temp_range && key[1] <= temp_range + 10
        by_tens << value
      end
    end
    by_tens.sum.to_f / by_tens.count.to_f
  end

  def most_rides_by_precipitation(rain_range)
    by_halves = {}
    @relevant_query.select do |key, value|
      if key[1] >= rain_range && key[1] < rain_range + 0.5
        by_halves[key] = value
      end
    end
    most_rides_rain_val = by_halves.values.max
    {most_rides_rain_val => by_halves.invert[most_rides_rain_val]}
  end

  def least_rides_by_precipitation(range)
    by_halves = {}
    @relevant_query.select do |key, value|
      if key[1] >= rain_range && key[1] < rain_range + 0.5
        by_halves[key] = value
      end
    end
    least_rides_rain_val = by_halves.values.min
    {least_rides_rain_val => by_halves.invert[least_rides_rain_val]}
  end 
end
