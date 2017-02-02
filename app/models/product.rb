class Product < ApplicationRecord
	has_many :comments, dependent: :destroy
	def category
		Category.find(self.category_id).name
	end
end
