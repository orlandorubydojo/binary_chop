class Karate
  empty_range = 0..-1
  
  def initialize(arr)
    @sorted_array = arr.sort!
    @default_range = Range.new(0,(@sorted_array.size-1))
  end
  
  def chop(item, search_range = @default_range)
    return -1 if search_range.size<1
    mdx = middle_of_range(search_range)
    middle_item = @sorted_array[mdx]
    if item == middle_item
      return mdx
    elsif item < middle_item
      return chop(item, left_range(mdx))
    else 
      return chop(item, right_range(mdx, search_range.max))
    end
  end
  
  def chop_without_recursion(item)
    search_range = @default_range

    while search_range.size>0 do
      mdx = middle_of_range(search_range)
      middle_item = @sorted_array[mdx]
      if item == middle_item
        return mdx
      elsif item < middle_item
        search_range = left_range(mdx)
      else 
        search_range = right_range(mdx, search_range.max)
      end
    end
    -1
  end

  private
  
  def middle_of_range(range = @default_range)
    if range.size>0
      return range.min + (range.max-range.min) / 2
    else
      return nil
    end
  end
  
  def left_range(excluded_index = middle_of_range())
    return excluded_index ? 0..(excluded_index-1) : empty_range
  end

  def right_range(excluded_index = middle_of_range(), max = @default_range.max)
    return excluded_index ? (excluded_index+1)..max : empty_range
  end
  
end