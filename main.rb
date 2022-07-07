require_relative 'lib/linked_list'
require 'pry'

list = LinkedList.new
list.append('first_node')
list.append('second_node')
list.append('third_node')
list.prepend('new_first_node')
list.insert_at('NEW thirds baby', 3)
list.remove_at(3)
list.remove_at(3)
puts list.to_s