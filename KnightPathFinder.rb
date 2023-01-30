require 'byebug'
require_relative 'PolyTreeNode.rb'

class KnightPathFinder
	attr_accessor :considered_positions, :root_node

	def initialize(position)
		 self.considered_positions = [position]
		 self.root_node = PolyTreeNode.new(position)
		 self.build_move_tree
	end

	def build_move_tree
		queue = [self.root_node]

		until queue.empty?
			out = queue.shift 
			
			moves = new_move_positions(out.position)

			moves.each do |move|
				child = PolyTreeNode.new(move)
				queue << child
				out.children << child
			end
		end
	end

	def self.valid_moves(pos)
		valid_moves = []
		changes = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
		
		changes.each do |move|
			valid_moves << [(pos[0] + move[0]), (pos[1] + move[1])] 
		end

		return valid_moves.select do |pair| 
			pair.all? {|coordinate| coordinate >= 0 && coordinate <= 7}
		end
	end

	def new_move_positions(pos)
		choices = KnightPathFinder.valid_moves(pos).select {|move| !considered_positions.include?(move) }
		choices.each do |choice|
			considered_positions << choice
		end
		choices
	end

	def find_path(end_pos)

		 return self.root_node if self.root_node.position == end_pos

		 self.root_node.children.each do |child|
		 	search_result = self.find_path(end_pos)
		 	return search_result if search_result != nil
		 end
     return nil
	end

end

kpf = KnightPathFinder.new([0, 0])
kpf.find_path([7,7])