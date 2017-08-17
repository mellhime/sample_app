require 'open-uri'

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

	def anime_search
		url = 'https://www.w3schools.com/xml/note.xml'
		doc  = Nokogiri::XML("<root><aliens><alien><name>Alf</name></alien></aliens></root>")
		@result = doc.xpath("//name")
	end

	private

		def anime_params
			params.require(:anime).permit(:name, :score, :progress)
		end
end
