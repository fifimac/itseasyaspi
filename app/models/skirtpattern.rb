class Skirtpattern < ActiveRecord::Base
  attr_accessible :canvas1, :canvas2, :canvas3, :inner_radius, :length, :makepattern, :outer_radius, :skirt_type, :unit, :user_id, :waist, :waistbandLgth, :waistbandWdth
  
	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
		    csv << column_names
		    all.each do |skirtpattern|
		      csv << skirtpattern.attributes.values_at(*column_names)
		    end
		end
	end
end


