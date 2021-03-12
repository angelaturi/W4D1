class Knightpathfinder

    DIRS = [ [2,1], [2,-1], [-2,1], [-2,-1], [1,2], [-1,2], [1,-2], [-1,-2] ]

    def self.root_node
        PolyTreeNode.new([0,0])
    end 

    def initialize(position)
        @position = position
    end 

    def self.valid_moves(position)
        valid_pos = []
        DIRS.each do |dir|
            dx, dy = dir 
            new_position = [position[0] + dx, position[1] + dy]
                if new_position.all? { |pos|  pos.between?(0,7)}
                valid_pos << new_position
                end 
            end 
        end 
        valid_pos
    end 
    
end 

# kpf = Knightpathfinder.new 