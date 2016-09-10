class QuestionsController < ApplicationController
	def index
		binding.pry
		render json: 
			Question.all.includes(:answers)
				.as_json(
					include: :answers
				)
	end

	def create(question)
		binding.pry
		Question.create 
			:title => question.title,
			:correct_answer_id => 3

	end
end