class Karate
  attr_reader :sorted_array

  def initialize(array)
    @sorted_array = array.sort
  end

  def chop(guess)
    middle_index = middlize(@sorted_array)
    if @sorted_array[middle_index] == guess
      return middle_index
    end

    if guess > @sorted_array[middle_index]
      @modify_sorted_array = @sorted_array[(middle_index+1)..-1]
      # stopped here
    end
  end

  def middlize(array)
    (array.length - 1) / 2
  end

end
