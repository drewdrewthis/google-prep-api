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
			if params[:answers]
				params[:answers].each do |answer|
					Answer.create :title => answer, :question_id => @question.id
				end
			end
		else
			puts "Question didn't save"
		end
		render :text => "New question create successfully. Question id is: #{@question.id}"
		#binding.pry
	end

	def destroy
		Question.find(params[:id]).destroy
		puts "Question #{params[:id]} deleted"
		render :text => "Question #{params[:id]} deleted"
	end
end