class PolyTreeNode

    attr_reader :parent, :children, :value
    

    def initialize(value, parent = nil, children = [])
        @parent = parent
        @children = children
        @value = value 
    end 

    #new node is the new parent 
    def parent=(new_node)
        if @parent == nil 
            @parent = new_node 
            @parent.children << self 
        elsif new_node == nil
            @parent = nil 
        else 
            @parent.children.delete(self)
            @parent = new_node
            @parent.children << self 
        end 
    end 

    def add_child(child_node)
        child_node.parent = self 
    end 

    def remove_child(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value

        self.children.each do |child|
            res = child.dfs(target_value)
            return res if res != nil
        end
        nil
    end

    def bfs(target_value)

        @queue = [self]
        until @queue.empty?
            current = @queue.shift
            return current if current.value == target_value
            @queue += current.children
        end
    end

end

#Testing 