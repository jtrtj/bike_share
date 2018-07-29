class ConditionsData
  attr_reader :trip_count_by_temp

  def initialize(trip_count_by_temp)
    @trip_count_by_temp = trip_count_by_temp
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
    @trip_count_by_temp.select do |key, value|
      if key[1] >= temp_range && key[1] <= temp_range + 10
        by_tens[key] = value
      end
    end
    most_rides_max_temp_val = by_tens.values.max
    {most_rides_max_temp_val => by_tens.invert[most_rides_max_temp_val]}
  end

  def least_rides_in_temp_range(temp_range)
    by_tens = {}
    @trip_count_by_temp.select do |key, value|
      if key[1] >= temp_range && key[1] <= temp_range + 10
        by_tens[key] = value
      end
    end
    least_rides_max_temp_val = by_tens.values.min
    {least_rides_max_temp_val => by_tens.invert[least_rides_max_temp_val]}
  end

  def average_rides_in_temp_range(temp_range)
    by_tens = []
    @trip_count_by_temp.select do |key, value|
      if key[1] >= temp_range && key[1] <= temp_range + 10
        by_tens << value
      end
    end
    by_tens.sum.to_f / by_tens.count.to_f
  end
end
