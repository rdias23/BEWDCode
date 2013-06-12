class ChallengeMaesterController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def start
	 total = 10
         all = Question.where("question_type = 'maester'").map {|x| x.id}
	 session[:questions] = all.sort_by{rand}[0..(total-1)]
	 
	 session[:total]   = total
	 session[:current] = 0
	 session[:correct] = 0
	 
	 redirect_to :action => "question"
  end

  def question
 	 @current = session[:current]
	 @total   = session[:total]
	 
	 if @current >= @total
		redirect_to :action => "end"
		return
	 end
	 
	 @question = Question.find(session[:questions][@current])
	 @choices = @question.choices.sort_by{rand}
	 
	 session[:question] = @question
	 session[:choices] = @choices 
  end

  def answer
         @current = session[:current]
	 @total   = session[:total]
	 
	 choiceid = params[:choice]
	 
	 @question = session[:question]
	 @choices  = session[:choices]
	 
	 @choice = choiceid ? Choice.find(choiceid) : nil
	 if @choice and @choice.correct
		@correct = true
		session[:correct] += 1
	 else
		@correct = false
	 end
	 
	 session[:current] += 1
  end

  def end
	 @correct = session[:correct]
	 @total   = session[:total]
	 
	 @score = @correct * 100 / @total 
         
         @user = current_user 
         @scoreboard = Scoreboard.new
         @scoreboard.user_id = @user.id
         @scoreboard.score_type = "maester"
         @scoreboard.score = @score
  
         @scoreboard.save

         @scoreboards = Scoreboard.all         
         @high_score_sorted_array_of_hashes = @scoreboards.sort_by { |hsh| hsh[:score] }.reverse
         @count = 1 
         @is_first_score = "true" 
         @previous_score = 9999999999
  end

  def create
  end

  def destroy
  end

end
