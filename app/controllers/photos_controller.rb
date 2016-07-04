class PhotosController < ApplicationController

	def new
	end

	def create
		@place = Place.find(params[:place_id])
		@photo = @place.photos.create(photo_params)
		#redirect_to place_path(@place)
	end

	private

	def photo_params
		params.require(:photo).permit(:picture, :caption)
	end
end
