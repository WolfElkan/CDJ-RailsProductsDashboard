class CreateCategories < ActiveRecord::Migration[5.0]
	def change
		create_table :categories do |t|
			t.string :name
			t.timestamps
		end
		add_reference :products, :category, foreign_key: true
		# Seed data
		Category.create(name:"Electronics")
		Category.create(name:"Household")
		Category.create(name:"Gardening")
		Category.create(name:"Automotive")
		Category.create(name:"Ninjas")
	end
end
