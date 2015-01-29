class TopicsController < ApplicationController

  before_action :authenticate_user!, except: :index
  before_action :set_topic, except: [:new, :create, :index, :random]

  def index
    @topics = Topic.page(params[:page]).per(5)
    @topics = @topics.were_published
  end

  def show
    @topic = Topic.find(params[:id])
    @examples = @topic.examples
    @comment = Comment.new
  end

  def new
    @topic = Topic.new
    @topic.build_hanyu
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.published_at = publishing? ? Time.zone.now : nil

    if @topic.save
      redirect_to @topic,
        flash: { success: "Topic is succesfully created." }
    else
      flash[:danger] = 'Topic has not been created.'
      render :new
    end
  end

  def update
    @topic.published_at = publishing? ? Time.zone.now : nil

    if @topic.update(topic_params)
      redirect_to @topic
    else
      render :edit
    end
  end

  def random
    @topic = Topic.were_published.map { |topic| topic.id }.sample
    redirect_to topic_path(@topic)
  end

  def star
    current_user.star!(@topic)
    respond_to do |format|
      format.js
    end
  end

  def unstar
    current_user.unstar!(@topic)
    respond_to do |format|
      format.js
    end
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:name, :info, { hanyu_attributes: [:meaning, :slow_speaking, :normal_speaking] })
    end

    def publishing?
      params[:commit] == "Publish"
    end
end
