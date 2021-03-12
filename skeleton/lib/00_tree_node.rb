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



end