class Manufacturer < ActiveRecord::Base
#	belongs_to :catalog
	has_many :catalogs
end
