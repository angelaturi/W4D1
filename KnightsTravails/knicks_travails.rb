require_relative "00_tree_node.rb"
require "byebug"
class KnightPathFinder

    DIRS = [ [2,1], [2,-1], [-2,1], [-2,-1], [1,2], [-1,2], [1,-2], [-1,-2] ]

    attr_reader :start_position 
    attr_accessor :considered_positions, :root_node

    def self.root_node
        PolyTreeNode.new([0,0])
    end 

    def self.valid_moves(position)
        valid_pos = []
        x, y = position 
        # debugger
        DIRS.each do |dir|
            dx, dy = dir 
            new_position = [x + dx, y + dy]
            if new_position.all? { |pos|  pos.between?(0,7)}
                valid_pos << new_position
            end 
        end 
        valid_pos
    end 

    def initialize(start_position)
        @start_position = start_position
        @considered_positions = [start_position]
        self.build_move_tree
    end 
    
    def new_moves_positions(pos)
        # v1
        consider_pos = DIRS.select { |pos| KnightPathFinder.valid_moves(pos)}
        # v2

        # KnightPathFinder.valid_moves(pos).reject { |new_pos| considered_positions.include?(new_pos) }
        #     .each { |new_pos| considered_positions << new_pos }
    end

    def build_move_tree
        self.root_node = PolyTreeNode.new(start_position)
        nodes = [root_node]
        until nodes.empty?
            current = nodes.shift
            current_position = current.value 
            new_moves_positions(current_position).each do |pos|
                next_node = PolyTreeNode.new(pos)
                current.add_child(next_node) 
                nodes << next_node
            end 
        end    
    end 

end 

  knight = KnightPathFinder.new([0,0])
p knight.root_node
p knight.valid_moves


# kpf = Knightpathfinder.new 

#   @queue = [self]
#         until @queue.empty?
#             current = @queue.shift
#             return current if current.value == target_value
#             @queue += current.children
#         end