class QuestionsController < ApplicationController
	def index
		binding.pry
		render json: 
			Question.all.includes(:answers)
				.as_json(
					include: :answers
				)
	end

	def create
		binding.pry
	end
end