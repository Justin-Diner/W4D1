class KnightPathFinder
	attr_accessor :considered_positions, :root_node

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
		changes = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
		
		changes.each do |move|
			valid_moves << [(pos[0] + move[0]), (pos[1] + move[1])] 
		end

		valid_moves.select do |pair| 
			pair.all? {|coordinate| coordinate >= 0 && coordinate <= 7}
		end
	end

	def new_move_positions(pos)
		choices = KnightPathFinder.valid_moves(pos).select {|valid| !considered_positions.include?(valid) }
		considered_positions << choices
		choices
	end
end

kpf = KnightPathFinder.new([0, 0])