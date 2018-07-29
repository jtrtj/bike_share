class ConditionsData
  attr_reader :trip_count_by_temp

  def initialize(trip_count_by_temp)
    @trip_count_by_temp = trip_count_by_temp
  end

  # def all_possible_rides_by_temp(temp_range)
  #   max_temp_trips_max = {}
  #   max_temp_trips_min = {}
  #   max_temp_trips_avg = {}
  #   whole_temp_range.step(10).each do |temp|
  #     max_temp_trips_max[temp] => most_rides_in_temp_range(temp)
  #   end
  # end

  def most_rides_in_temp_range(temp_range)
    by_tens = {}
    @trip_count_by_temp.select do |key, value|
      if key[1] >= temp_range.min && key[1] <= temp_range.max
        by_tens[key] = value
      else
        0
      end
    end
    most_rides_max_temp_val = by_tens.values.max
    {most_rides_max_temp_val => by_tens.invert[most_rides_max_temp_val]}
  end

  def least_rides_in_temp_range(temp_range)
    by_tens = {}
    @trip_count_by_temp.select do |key, value|
      if key[1] >= temp_range.min && key[1] <= temp_range.max
        by_tens[key] = value
      else
        0
      end
    end
    least_rides_max_temp_val = by_tens.values.min
    {least_rides_max_temp_val => by_tens.invert[least_rides_max_temp_val]}
  end

  def average_rides_in_temp_range(range)
  end
end
