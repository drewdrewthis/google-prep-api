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
		puts (question)
		#Question.create :title => question.title, :correct_answer_id => question.correct_answer_id
	end
end