class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @examples = @topic.examples
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    topic = Topic.new(topic_params)
    if topic.save
      redirect_to topics_path,
                  flash: { success: "Topic [#{topic.name}] is succesfully created." }
    else
      flash[:error] = 'Topic has not been created.'
      render :new
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:name)
    end
end
