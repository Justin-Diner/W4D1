class KnightPathFinder
	attr_accessor :considered_positions

	def initialize(position)
		 self.considered_positions = [position]
		 self.root_node = position
		 self.build_move_tree(root_node)

	end

	def build_move_tree(start_pos)
		queue = [start_pos]
		
	end

	def self.valid_moves(pos)
		valid_moves = []
		
	end

	def new_move_positions(pos)
		choices = KnightPathFinder.valid_moves(pos).select {|valid| !considered_positions.include?(valid) }
		considered_positions << choices
		choices
	end
end

kpf = KnightPathFinder.new([0, 0])