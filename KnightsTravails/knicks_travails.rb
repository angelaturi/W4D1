require_relative "00_tree_node.rb"
require "byebug"
class KnightPathFinder

    DIRS = [ [2,1], [2,-1], [-2,1], [-2,-1], [1,2], [-1,2], [1,-2], [-1,-2] ]

    attr_reader :start_position 
    attr_accessor :considered_positions, :root_node

    # def self.root_node
    #     PolyTreeNode.new([0,0])
    # end 

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
        @root_node = PolyTreeNode.new(start_position)
        @start_position = start_position
        @considered_positions = [start_position]
        build_move_tree
    end 
    
    def new_moves_positions(pos)

        valid = KnightPathFinder.valid_moves(pos)

        new_moves = valid.select{ |pos| !@considered_positions.include?(pos) }
        @considered_positions += new_moves
        new_moves

        # v1
        # consider_pos = DIRS.select { |pos| KnightPathFinder.valid_moves(pos)}
        # v2

        # KnightPathFinder.valid_moves(pos).reject { |new_pos| considered_positions.include?(new_pos) }
        #     .each { |new_pos| considered_positions << new_pos }
    end

    def build_move_tree
        # self.root_node = PolyTreeNode.new(start_position)
        queue = [root_node]
        until queue.empty?
            # debugger
            # p nodes.map { |node| node.value }
            current = queue.shift
            new_pos = new_moves_positions(current.value)
            new_pos.each do |pos|
                child_node = PolyTreeNode.new(pos)
                current.add_child(child_node)
                queue << child_node
            # current_position = current.value 
            # debugger
            # new_moves_positions(current_position).each do |pos|
            #     # p pos
            #     next_node = PolyTreeNode.new(pos)
            #     current.add_child(next_node) 
            #     queue << next_node
            end 
        end
        root_node
    end 

end 

kpf = KnightPathFinder.new([0,0])
# p kpf.valid_moves
# kpf.root_node
kpf.new_moves_positions([0,0])
# kpf.find_path([2, 1])

#   knight = KnightPathFinder.new([0,0])
# p knight.root_node
# p knight.valid_moves


# kpf = Knightpathfinder.new 

#   @queue = [self]
#         until @queue.empty?
#             current = @queue.shift
#             return current if current.value == target_value
#             @queue += current.children
#         end