class Product < ApplicationRecord
	def category
		Category.find(self.category_id).name
	end
end
