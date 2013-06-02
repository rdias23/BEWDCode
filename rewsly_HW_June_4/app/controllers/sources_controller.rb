class SourcesController < ApplicationController
  def index
    @sources = Source.all
  end

  def new
    @source = Source.new
  end

  def create
    source_params = params.require(:source).permit(:name, :website)
    @source = Source.new source_params
    if @source.save
      redirect_to @source, notice: "Source #{@source.name} added to the site"
    else
      render 'new'
    end
  end

  def show
    @source = Story.find(params[:id]).source
    @stories = @source.stories
  end

end
