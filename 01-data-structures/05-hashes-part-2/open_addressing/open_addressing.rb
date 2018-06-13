require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    node = Node.new(key, value)
    i = index(key, size)

    # Check if index is currently occupied by a different key
    if !@items[i].nil? && @items[i].key != key
      # Linearly look for the next available index
      size.times do
        break if @items[i].nil? || @items[i].key == key
        i += 1
        i = 0 if i == size
      end

      # If the array is full, resize and recalculate the index
      resize
      i = next_open_index(index(key, size))
    end

    @items[i] = node
  end

  def [](key)
    i = index(key, size)

    size.times do
      if @items[i].nil?
        return nil
      elsif @items[i].key == key
        return @items[i].value
      end
      i += 1
      i = 0 if i == size
    end

    nil
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0

    key.each_byte do |c|
      sum += c
    end

    sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    size.times do
      if @items[index].nil?
        return index
      else
        index += 1
        index = 0 if index == size
      end
    end

    -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    new_array = Array.new(size * 2)

    @items.each do |item|
      next if item.nil?
      i = index(item.key, new_array.length)

      # Find the next open index in the new array for current item
      new_array.length.times do
        if new_array[i].nil?
          break
        else
          i += 1
          i = 0 if i == new_array.length
        end
      end

      new_array[i] = item
    end

    @items = new_array
  end
end