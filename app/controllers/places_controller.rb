class PlacesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update]

	def index
		# see https://github.com/mislav/will_paginate
		# @places = Place.all
		# @places = Place.paginate(:page => params[:page])
		@places = Place.paginate(:page => params[:page], :per_page => 1)
	end

	def new
		@place = Place.new
	end

	def create
		# used to be --> Place.create(place_params)
		current_user.places.create(place_params)
		redirect_to root_path
	end

	def show
		@place = Place.find(params[:id])
	end

	def edit
		@place = Place.find(params[:id])

		if @place.user != current_user
			return render text: 'Not Allowed, Dude. Stop it--Not Cool.', status: :forbidden
			# want to use 'not_acceptable'
		end
	end

	def update
		@place = Place.find(params[:id])

		if @place.user != current_user
			return render text: 'Not Allowed, Dude. Not Cool.', status: :forbidden
		end
		
		@place.update_attributes(place_params)
		redirect_to root_path
	end

	def destroy
		@place = Place.find(params[:id])
		@place.destroy
		redirect_to root_path
	end



	private

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end

end
