class StoriesController < ApplicationController
  def index
    		@stories = Story.all
  end

  def search
		query = params[:q]
		@stories = Story.search_for(query)
  end
  def new
  end

  def create
    @story = Story.new(params[:story].permit(:title, :link, :category))

    @story.save
    redirect_to @story
  end

  def show
    @story = Story.find(params[:id])
  end
end
