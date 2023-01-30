class PolyTreeNode
	attr_accessor :position, :children, :root_node

	def initialize(position)
		# self.position = position
		self.root_node = position
		self.children = []
		
	end

	def self.populate
		
	end


end