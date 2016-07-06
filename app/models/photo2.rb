class Photo2 < ActiveRecord::Base
	belongs_to :place
	mount_uploader :picture, PictureUploader
end
