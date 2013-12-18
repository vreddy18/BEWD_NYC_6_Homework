class RpsController < ApplicationController
	def index
	
	end
	def show
		@number = rand(3) + 1
		@guess = params[:id].to_i
	end
end