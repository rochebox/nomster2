class PlacesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

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
	end

	private

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end

end
