class ConditionsData
  def initialize(trip_count_by_temp)
    @trip_count_by_temp = trip_count_by_temp
  end

  def most_rides_in_temp_range
    forties = []
    fifties = []
    sixties = []
    seventies = []
    eighties = []
    nineties = []
    @trip_count_by_temp.each_pair do |key, count|
      if key[1] >= 40 || <= 49
                
      end
    end
  end
end
