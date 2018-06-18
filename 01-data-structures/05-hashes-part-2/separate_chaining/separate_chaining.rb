require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size = 5)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size)
    node = Node.new(key, value)

    if !@items[i]
      @items[i] = LinkedList.new()
    end

    @items[i].add_to_front(node)

    if self.load_factor > @max_load_factor
      self.resize
    end
  end

  def [](key)
    i = index(key, size)

    if !@items[i].nil?
      node = @items[i].head
      while node
        if node.key == key
          return node.value
        end
        node = node.next
      end
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

  # Calculate the current load factor
  def load_factor
    count = 0.0

    @items.each do |bucket|
      if !bucket.nil?
        count += bucket.size
      end
    end

    count / self.size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    arr = Array.new(self.size * 2)

    @items.each do |bucket|
      if !bucket.nil?
        node = bucket.head

        while node
          i = index(node.key, arr.length)

          if arr[i].nil?
            arr[i] = LinkedList.new()
          end

          arr[i].add_to_front(node)
          node = node.next
        end
      end
    end

    @items = arr
  end

  def pretty_print
    @items.each_with_index do |bucket, i|
      print "[ #{i} ]"

      if !bucket.nil?
        print ' -> '
        node = bucket.head

        while node
          print '["' + node.key + '": "' + node.value + '"]'
          if !node.next.nil?
            print ' -> '
          end
          node = node.next
        end
      end

      print "\n"
    end
    puts "Load Factor: " + self.load_factor.to_s
  end
end
