class PolyTreeNode
	attr_accessor :position, :children, :root_node

	def initialize(position)
		# self.position = position
		self.position = position
		self.children = []
		
	end

	def self.populate
		
	end

	
  def inspect
    "Position: #{self.position} | Children: #{self.children}"
  end

end