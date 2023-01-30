require_relative 'PolyTreeNode.rb'

class KnightPathFinder
	attr_accessor :considered_positions, :root_node

	def initialize(position)
		 self.considered_positions = [position]
		 self.root_node = position
		 self.build_move_tree(root_node)

	end

	def build_move_tree(start_pos)
		queue = [start_pos]
		
		until queue.empty?
			out = queue.shift 
			node = PolyTreeNode.new(out)
			moves = new_move_positions(out)

			moves.each do |move|
				queue << move
				node.children << PolyTreeNode.new(move)
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
end

kpf = KnightPathFinder.new([0, 0])