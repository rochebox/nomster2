class PlacesController < ApplicationController

	def index
		# see https://github.com/mislav/will_paginate
		# @places = Place.all
		# @places = Place.paginate(:page => params[:page])
		@places = Place.paginate(:page => params[:page], :per_page => 1)
	end

	def new
		@place = Place.new
	end
end
