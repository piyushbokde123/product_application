class Product < ApplicationRecord
	validates :name, :price, :company, :quantity, presence: true
end
