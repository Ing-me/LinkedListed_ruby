class LinkedList
    attr_accessor :head, :size

    class Node
        attr_accessor :value, :next
        def initialize(v, n=nil)
            self.value = v
            self.next = n
        end
    end

    def initialize()
        self.head = nil
        self.size = 0
    end

    def count()
        return self.size
    end

    def isEmpty()
        return self.size == 0
    end

    def peek()
        if(self.isEmpty())
            throw raise StandardError, "EmptyListException"
        end
        return self.head.value
    end

    # Prepend a value in the linkedlist
    def prepend(value)
        self.head = Node.new(value, self.head)
        self.size += 1
    end

    # Append a value in the linkedlist
    def append(value)
        newNode = Node.new(value, nil)
        current = self.head 
        if (self.head == nil)
            self.head = newNode
        end
        while(current.next != nil)
            current = current.next
        end
        current.next = newNode
    end

    # Return the head of the linked list
    def head_of_linkedList
       previous_head = self.head
       self.head = self.head.next
       previous_head.next = nil
       return previous_head
    end

    # Return the total number of the node
    def number_of_node
        curr = self.head
        count = 0
        if(curr == nil)
            return count
        end
        while(curr != nil)
            count += 1
            curr = curr.next
        end 
        return count
    end   

    # Return the last node in the list
    def tail
        curr = self.head
        until(curr.next == nil)
            curr = curr.next
        end
        return curr
    end

    # Return the node at the given index
    def node_at_given_index(index)
        curr = self.head 
        count = 0
        if(index == 0)
            return curr
        end
        
        while(curr.next != nil)
            if(count == index)
                return curr
            end
            count += 1
            curr = curr.next
        end
    end

    # Remove the last element of the list
    def pop
        curr = self.head
        if(self.isEmpty())
            throw raise StandardError, "EmptyListException"
        end
        while(curr.next.next != nil)
           curr = curr.next
        end
        curr.next = nil
    end

    # Verify if a list includes a value
    def contain?(data)

         curr = self.head

        if(self.isEmpty())
            throw raise StandardError, "EmptyListException"
        end
        while(curr != nil)
            if(curr.value.include?(data))
                return true
            end
            curr = curr.next
        end
        return false
    end

    # Find the index of a given value
    def find_index(data)
        curr = self.head

        index = 0; 
        if(self.isEmpty())
            throw raise StandardError, "EmptyListException"
        end

        while(curr != nil)
            if(curr.value == data)
                return index
            end
            curr = curr.next
            index += 1
        end
        return nil
    end

    def to_s
        curr = self.head
        string = String.new
        while(curr != nil)
            string << curr.value + " -> "
            curr = curr.next
        end
        string << "nil"
    end

    # Inserts a new node with the provided value at the given index
    def insert_at(value, index)
        curr = self.head
        
        if(self.isEmpty())
            throw raise StandardError, "EmptyListException"
        end

        (index - 1).times do
            curr = curr.next
        end

        new_node = Node.new(value)
        new_node.next = curr.next
        curr.next = new_node

    end

    # Removes the node at the given index
    def remove_at(index)
        curr = self.head
        count = 0;

        if(isEmpty())
            return false
        end

        if(index == count)
            self.head = self.head.next
            self.size -= 1
            return true
        end
        while(curr.next != nil)
            count += 1 
            if(count == index)
                p count
                p index
                curr.next = curr.next.next
                self.size -= 1
                return true
            end            
            curr = curr.next               
        end
        return false       
    end
    
    # Display all the linkedlist
    def display()
        temp = self.head
        while(temp != nil)
            print(temp.value.to_s + " -> ")
            temp = temp.next
        end
        print("\n")
    end

end

linkedlist = LinkedList.new
linkedlist.prepend("John")
linkedlist.prepend("Peter")
linkedlist.prepend("Mary")
linkedlist.display

