class LinkedListNode				#create class to create node instances/objects
  attr_accessor :value, :next_node      #getter/setter

  def initialize(value, next_node=nil)   #takes two arguments, nil represents head
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data          #make data instances readable (getter)

  def initialize
    @data = nil				#initialize to nil for start/empty
  end

  def push(value)								#a value is given to be pushed
    @data = LinkedListNode.new(value, @data)    #new node object created via LLN class and value stored in @data instance
  end

  def pop
    return print "nil\n" if @data.nil?      #if data value is nil print that (aka empty stack)
    print "#{@data.value}\n"				#print current data value
    @data = @data.next_node					#next node in stack becomes data
  end

end

def reverse_list(list)					
  stack = Stack.new					#new stack object
  while list						#while list has nodes to give
    stack.push(list.value)			#push/add value to stack
    list = list.next_node			#next value becomes current, loop continues
  end

  return stack.data
end

def print_values(node_number)    # our created node objects as parameter
  if node_number     #so long as list node exists
    print "#{node_number.value} --> "  # print node value
    print_values(node_number.next_node) #call print_values (self) with next node 
  else
    print "nil\n"			#when next_node no longer exists print nil
    return					#return.. aka exit function
  end
end

node1 = LinkedListNode.new(9)			#node instances with values and pointers to next node
node2 = LinkedListNode.new(62, node1)
node3 = LinkedListNode.new(34, node2)

print_values(node3)         #will print nodes starting from node3
puts "---------"			#line break
revlist = reverse_list(node3)		#will put nodes into stack 
print_values(revlist)		#passing revlist containing the reversed stack, prints LIFO