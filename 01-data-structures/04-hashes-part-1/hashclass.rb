require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size)

    if !@items[i]
      @items[i] = HashItem.new(key, value)
    elsif @items[i].key == key
      @items[i].value = value
    else
      resize
      self[key] = value
    end
  end


  def [](key)
    i = index(key, size)

    if @items[i]
      @items[i].value
    end
  end

  def resize
    newArr = Array.new(size * 2)

    @items.each do |item|
      if item
        i = index(item.key, newArr.size)

        newArr[i] = item
      end
    end

    @items = newArr

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

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

end
