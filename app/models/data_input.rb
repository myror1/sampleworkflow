class DataInput < ActiveRecord::Base
	has_attached_file :tab
  validates :tab, presence: true ,format: {  with: %r{\.(tab|tsv)\z}i , message: "Please enter .tab file only"}
end
