module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here

  def my_each
    unless block_given? then return self end

    for i in 0...self.length
      yield self[i]
    end
      self
  end

  def my_each_with_index
    unless block_given? then return self end

    for i in 0...self.length
      yield self[i], i
    end
      self
  end

  def my_all?
    unless block_given? then return self end

    for i in 0...self.length
      if yield(self[i]) != true
        return false
      end
    end
    true
  end

  def my_any?
    unless block_given? then return self end

      for i in 0...self.length
        if yield(self[i]) == true
          return true
        end
      end
      false
  end

  def my_none?
    unless block_given? then return self end

    for i in 0...self.length
      if yield(self[i]) == true
        return false
      end
    end
      true
  end

  def my_count
    unless block_given? then return self.length end

    counter = 0

    for i in 0...self.length
      if yield(self[i]) == true
        counter += 1
      end
    end
    counter
  end

  def my_map
    unless block_given? then return self end
        
      res_array = []
  
      for i in 0...self.length
        res_array << yield(self[i])
      end
      res_array
  end
  
  def my_select
    unless block_given? then return self end

    res_array = []

    for i in 0...self.length
      if yield(self[i]) == true
        res_array << self[i]
      end
    end
    res_array
  end

  def my_inject(start_value)
    acc = start_value

    for i in 0...self.length
      acc = yield(acc, self[i])
    end
    acc
  end
end
