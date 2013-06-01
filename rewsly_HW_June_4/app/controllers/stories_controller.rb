class StoriesController < ApplicationController
  def index
    		@stories = Story.all
  end

  def search
		query = params[:q]
		@stories = Story.search_for(query)
  end
  def new
    @story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    @story.update(params[:story].permit(:title, :link, :category, :tag_list))
    redirect_to @story
  end

  def create
    @story = Story.new(params[:story].permit(:title, :link, :category, :tag_list))

    if @story.save
      @story.upvotes += 1 
      redirect_to @story
    else
      render 'new'
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to root_path, notice: "#{@story.title} has been deleted"
  end
end
