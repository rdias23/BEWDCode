class QuestionsController < ApplicationController
def index
  @questions = Question.all
  @questions.sort! {|a,b| a.text <=> b.text}
end
def new
  @question = Question.new
end
def create
  questions_params = params.require('question').permit(:text)  
  @question = Question.new(questions_params)

  if @question.save
    redirect_to(@question, :notice => 'Question was successfully created.')
  else
    render :action => "new"
  end
end
def show
  @question = Question.find(params[:id])

end  
def edit
  @question = Question.find(params[:id])
end
end
