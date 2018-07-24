require_relative 'node'

class MinBinaryHeap
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, new_node)
    return if root.nil? || new_node.nil?
    # First insert new_node at the end of the heap...
    heap_array = [root]
    i = 0
    while heap_array[i]
      current_node = heap_array[i]

      heap_array.push(current_node.left) if current_node.left
      heap_array.push(current_node.right) if current_node.right

      i += 1
    end
    heap_array[i] = new_node

    parent = find_parent(heap_array, i)

    isLeftNode = (i - 1) % 2 == 0
    if isLeftNode
      parent.left = new_node
    else
      parent.right = new_node
    end

    # Then repeatedly swap the parent with new_node until the parent is not greater than new_node
    while parent >= new_node
      # Switch new_node with its parent
      heap_array[(i-1)/2] = new_node
      heap_array[i] = parent
      if isLeftNode
        temp = parent.right
        parent.left = new_node.left
        parent.right = new_node.right
        new_node.left = parent
        new_node.right = temp
      else
        temp = parent.left
        parent.left = new_node.left
        parent.right = new_node.right
        new_node.right = parent
        new_node.left = temp
      end

      # Assign the new_node as a child of the parent's parent.
      i = (i - 1) / 2
      i = 0 if i < 0
      parent = find_parent(heap_array, i)
      isLeftNode = (i - 1) % 2 == 0
      if parent
        if isLeftNode
          parent.left = new_node
        else
          parent.right = new_node
        end
      end

      # Assign new_node as @root if it's at the top of the tree
      if heap_array[0] == new_node
        @root = new_node
        break
      end
    end
  end

  # Find the parent of a node given an implicit representation of the heap and the index of the node
  def find_parent(heap_array, index)
    parent_index = (index - 1) / 2
    return nil if parent_index < 0
    heap_array[parent_index]
  end

  # Recursive Depth First Search
  def find(root, data)
    return if data.nil? || root.nil?
    if root.title == data
      return root
    elsif left_child = find(root.left, data)
      return left_child
    elsif right_child = find(root.right, data)
      return right_child
    end
    nil
  end

  def delete(root, data)
    return if root.nil? || data.nil?

    # Populate the heap array
    heap_array = [root]
    i = 0
    while heap_array[i]
      current_node = heap_array[i]
      index = i if heap_array[i].title == data

      heap_array.push(current_node.left) if current_node.left
      heap_array.push(current_node.right) if current_node.right

      i += 1
    end
    deleted_node = heap_array[index]
    last = i - 1

    # Delete the node and return if it's the last leaf
    if index == last
      parent = find_parent(heap_array, index)
      is_left_node = parent && (index - 1) % 2 == 0

      if is_left_node
        return parent.left = nil if parent
      else
        return parent.right = nil if parent
      end
    end

    # Switch the node to be deleted with the last leaf and delete it
    heap_array[index] = heap_array[last]
    heap_array[last] = nil

    parent_of_last = find_parent(heap_array, last)
    last_is_left_node = (last - 1) % 2 == 0

    if last_is_left_node
      parent_of_last.left = nil if parent
    else
      parent_of_last.right = nil if parent
    end

    # If root node is being deleted, replace it with a new absolute min
    if index == 0
      heap_array[index].left = @root.left unless heap_array[index] == @root.left
      heap_array[index].right = @root.right unless heap_array[index] == @root.right

      @root = heap_array[index]
    end

    move_down(index, heap_array)
    deleted_node
  end

  # Recursively move the node at `index` down the tree
  def move_down(index, heap_array)
    return if (node = heap_array[index]) == nil
    parent = find_parent(heap_array, index)

    if node.left && node.left <= node && (node.right.nil? || node.left <= node.right)
      temp = node.right
      heap_array[index] = node.left
      node.left = heap_array[index].left
      node.right = heap_array[index].right
      heap_array[index].right = temp
      heap_array[index].left = node
      new_index = index * 2 + 1
    elsif node.right && node.right <= node && (node.left.nil? || node.right <= node.left)
      temp = node.left
      heap_array[index] = node.right
      node.left = heap_array[index].left
      node.right = heap_array[index].right
      heap_array[index].left = temp
      heap_array[index].right = node
      new_index = index * 2 + 2
    else
      return
    end

    heap_array[new_index] = node

    if parent
      isLeftNode = (index - 1) % 2 == 0
      if isLeftNode
        parent.left = heap_array[index]
      else
        parent.right = heap_array[index]
      end
    else
      @root = heap_array[index]
    end

    move_down(new_index, heap_array)
  end

  # Recursive Breadth First Search
  def printf(queue = Array.new())
    queue.push(@root);

    while queue[0]
      current_node = queue.shift()

      print "#{current_node.title}: #{current_node.rating}\n"

      current_node.left && queue.push(current_node.left)
      current_node.right && queue.push(current_node.right)
    end
  end
end
