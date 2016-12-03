class Catalog < ActiveRecord::Base
#	has_many :manufacturers
	belongs_to :manufacturer
end
