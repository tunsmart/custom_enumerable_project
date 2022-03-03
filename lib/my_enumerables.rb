module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i],i)
      i += 1
    end
    self
  end

  def my_select
    arr = []
    self.my_each do |item|
      arr << item if yield(item)
    end
    arr
  end

  def my_all?
    arr = []
    self.my_each do |item|
      arr << yield(item)
    end
    if arr.uniq.length > 1 || !arr.uniq[0]
      return false
    else
      return true
    end
  end

  def my_any?
    result = false
    iterator = 0

    until result
      self.my_each do |item|
        result = true if yield(item)
      end
      iterator += 1
      break if iterator == self.length
    end
    result
  end

  def my_none?
    result = true
    iterator = 0

    while result
      self.my_each do |item|
        result = false if yield(item)
      end
      iterator += 1
      break if iterator == self.length
    end
    result
  end

  def my_count
    count = 0
    if block_given?
      self.my_each do |item|
        count += 1 if yield(item)
      end
    else
       count = self.size
    end
    count
  end

  def my_map
    arr = []
    self.my_each{|item| arr << yield(item)}
    arr
  end

  def my_inject(init)
    result = 0
    self.my_each do |item|
      temp = yield(init, item)
      init = temp
      result = temp
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
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end
end
