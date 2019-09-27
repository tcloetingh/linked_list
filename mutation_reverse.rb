# Reverse a linked list using mutation

class LinkedListNode                    #class allowing us to create linkedlistnode objects
  attr_accessor :value, :next_node      #important so we can reverse pointers

  def initialize(value, next_node=nil)  #create node object with head and pointer to next node
    @value = value
    @next_node = next_node    #initialized to nil by default 
  end
end

def reverse_list(list_node, previous=nil)    #passing a node (end of the chain)
  current_head_value = list_node.next_node       #node passed is set to next node ie node 4 is now node 3
  list_node.next_node = previous           #change their pointers backwards.. node 3 points to 4
  if current_head_value                     #if theres a value continue
    reverse_list(current_head_value, list_node)  #repeat process with node3 -> node2 and node2 -> node1
  else                                
    return                              #jump out of method... object attributes are all changed
  end
end

def print_values(list_node)       #passing a node aka where to start on the chain
  if list_node                    #so long as node object exists
    print "#{list_node.value} --> " #print the value associated with the object
    print_values(list_node.next_node)   #run it again.. now the next_node pointing to other node object becomes the list_node and its value is printed
  else
    print "nil\n"       #this continues until no object is being pointed to aka nxt_nd == nil... at which point we print nil
    return            #end the method, print job is complete 
  end
end

node1 = LinkedListNode.new(37)          #instantiate 4 node objects 
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(54, node3)
                                      #program execution
print_values(node4)                   #run print method starting at node4... technically the front 
puts "---------"                      #little <hr>ish line break for asthetics
reverse_list(node4)                   #run reverse_list method... it will rearrange the pointers
print_values(node1)                   #run print again, but use node1 (the new front of list after reversal)

