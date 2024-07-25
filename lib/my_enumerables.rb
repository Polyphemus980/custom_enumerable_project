module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for item in self
      yield(item,index)
      index += 1
    end
  end

  def my_all?
    for item in self
      unless yield(item)
        return false
      end
    end
    true
  end

  def my_select
    result = []
    for item in self
      if yield(item)
        result << item
      end
    end
    result
  end

  def my_any?
    for item in self
      if yield(item)
        return true
      end
    end
    false
  end

  def my_none?
    for item in self
      if yield(item)
        return false
      end
    end
    true
  end

  def my_count
    unless block_given?
      return self.size
    end
    count = 0
    for item in self
      if yield(item)
        count += 1
      end
    end
    count
  end

  def my_map
    result = []
    for item in self
      result << yield(item)
    end
    result
  end

  def my_inject(init)
    result = init
    for item in self
      result = yield(result,item)
    end
    result
  end
end


# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield(item)
    end
  end
end
