class QuestionsController < ApplicationController
	def index
		#binding.pry
		render json: 
			Question.all.includes(:answers)
				.as_json(
					include: :answers
				)
	end

	def create
		#binding.pry
		@question = Question.new(:title => params[:title], :correct_answer_id => params[:correct_answer])
		if @question.save
			puts "New question create successfully. Question id is: #{@question.id}"
			params[:answers].each do |answer|
				Answer.create :title => answer, :question_id => @question.id
			end
		else
			puts "Question didn't save"
		end
		#Question.create :title => params[:title], :correct_answer_id => params[:correct_answer]
	end
end