class Photo2sController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@place = Place.find(params[:place_id])
		@place.photo2s.create(photo2_params)
		redirect_to place_path(@place)
	end

	def photo2_params
		params.require(:photo2).permit(:caption)
	end

end
