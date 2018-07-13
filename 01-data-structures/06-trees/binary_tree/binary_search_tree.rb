require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    case direction = node <=> root
    when -1
      if root.left.nil?
        root.left = node
      else
        insert(root.left, node)
      end
    when 1
      if root.right.nil?
        root.right = node
      else
        insert(root.right, node)
      end
    end
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
    return if data.nil? || root.nil?
    if root.title == data
      if root.left
        root = root.left
      elsif root.right
        root = root.right
      else
        root = nil
      end
      return
    end

    if root.left
      if root.left.title == data
        if root.left.left
          root.left = root.left.left
        elsif root.left.right
          root.left = root.left.right
        else
          root.left = nil
        end
        return
      else
        delete(root.left, data)
      end
    end

    if root.right
      if root.right.title == data
        if root.right.left
          root.right = root.right.left
        elsif root.right.right
          root.right = root.right.right
        else
          root.right = nil
        end
      else
        delete(root.right, data)
      end
    end
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
