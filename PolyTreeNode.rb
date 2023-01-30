class PolyTreeNode
	attr_accessor :position, :neighbors, :root_node

	def initialize(position)
		# self.position = position
		self.root_node = position
		self.neighbors = []
		
	end

	def self.populate
		
	end


end