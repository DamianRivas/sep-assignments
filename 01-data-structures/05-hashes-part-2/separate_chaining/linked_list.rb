require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @tail
      @tail.next = node
    else
      @head = node
    end

    @tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if !@head
      return
    elsif @head == @tail
      @head = nil
      @tail = nil
    else
      node = @head

      while node do
        if node.next == @tail
          @tail = node
          node.next = nil
          break
        end

        node = node.next
      end
    end
  end

  # This method prints out a representation of the list.
  def print
    node = @head

    while node do
      puts node.data
      node = node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if !@head
      return
    elsif @head == node
      if @head == @tail
        @head == nil
        @tail == nil
      else
        @head = @head.next
      end
    else
      temp_node = @head

      while temp_node do
        if temp_node.next == node
          to_be_removed = temp_node.next
          temp_node.next = temp_node.next.next

          if @tail == to_be_removed
            @tail = temp_node
          end

          to_be_removed.next = nil
          break;
        end
        temp_node = temp_node.next
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if !@head
      @head = node
      @tail = node
      return
    end

    temp = @head

    @head = node
    @head.next = temp
    temp = nil
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if !@head
      return
    end

    temp = @head

    @tail = @head == @tail ? nil : @tail
    @head = @head.next
    temp = nil
  end
end