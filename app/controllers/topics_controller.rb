class TopicsController < ApplicationController

  def index
    @topics = Topic.page(params[:page]).per(5)
  end

  def show
    @topic = Topic.find(params[:id])
    @examples = @topic.examples
  end

  def new
    @topic = Topic.new
    @topic.build_hanyu
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to @topic,
                  flash: { success: "Topic is succesfully created." }
    else
      flash[:danger] = 'Topic has not been created.'
      render :new
    end
  end

  def random
    @topic = Topic.all.sample
    redirect_to @topic
  end

  private
    def topic_params
      params.require(:topic).permit(:name, { hanyu_attributes: [:meaning, :speaking] })
    end
end
