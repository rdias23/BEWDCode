class HomeController < ApplicationController
  def index
    @users = User.all

    @scoreboards = Scoreboard.all         
    @high_score_sorted_array_of_hashes = @scoreboards.sort_by { |hsh| hsh[:score] }.reverse
    @count = 1 
    @is_first_score = "true" 
    @previous_score = 9999999999
  end
end
