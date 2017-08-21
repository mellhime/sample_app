class AnimesController < ApplicationController

	def show
		@anime = Anime.find(params[:id])
	end

	def new
		@anime = Anime.new
	end

	def index
		@anime_list = current_user.animes
	end

	def create
		@anime = Anime.new(anime_params)
		@anime.user = current_user
		if @anime.save
			flash[:success] = "Anime successfully added!"
			redirect_to @anime
		else
			render 'new'
		end
	end

	def destroy
		Anime.find(params[:id]).destroy
		flash[:success] = "Anime deleted."
		redirect_to '/animes'
	end

	def search
	end

	private

		def anime_params
			params.require(:anime).permit(:name, :score, :progress)
		end

end
