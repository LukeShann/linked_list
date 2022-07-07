require_relative 'node'

class LinkedList
  attr_reader :root

  def new_root(value)
    @root = Node.new(value)
  end

  def append(value, node = @root)
    if @root.nil?
      new_root(value)
      return
    end
    if node.next_node.nil?
      node.next_node = Node.new(value)
      return
    end
    append(value, node.next_node)
  end

  def prepend(value)
    if @root.nil?
      new_root(value)
      return
    end
    @root = Node.new(value, @root)
  end
  
  def size(count = 1, node = @root)
    return 0 if node.nil?
    return count if node.next_node.nil?
    size(count + 1, node.next_node)
  end
  
  def head
    @root
  end
  
  def tail(node = @root)
    return 'ERROR: List is empty' if node.nil?
    return node if node.next_node.nil?
    tail(node.next_node)
  end
  
  def at(index, count = 0, node = @root)
    return 'ERROR: Out of range' if node.nil?
    return node if index == count
    at(index, count + 1, node.next_node)
  end
  
  def pop(node = @root)
    at(size - 2).next_node = nil
  end
  
  def contains?(value, node = @root)
    return true if node.value == value
    return false if node.next_node == nil
    contains?(value, node.next_node)
  end
  
  def find(value, index = 0, node = @root)
    return index if node.value == value
    return nil if node.next_node == nil
    find(value, index + 1, node.next_node)
  end
  
  def to_s(str = '', node = @root)
    return str + 'nil' if node.nil?
    to_s(str + "#{node.value} -> ", node.next_node)
  end

  def insert_at(value, index)
    prev_node = at(index - 1)
    prev_node.next_node = Node.new(value, prev_node.next_node)
  end
  
  def remove_at(index)
    prev_node = at(index - 1)
    prev_node.next_node = prev_node.next_node.next_node
  end
end