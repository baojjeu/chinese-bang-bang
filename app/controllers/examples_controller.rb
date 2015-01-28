class ExamplesController < ApplicationController
  before_action :set_topic
  before_action :set_example, except: [:new, :create]

  def new
    @example = @topic.examples.build
    @example.build_hanyu
  end

  def edit
  end

  def create
    @example = @topic.examples.new(example_params)
    if @example.save
      render :edit
    else
      flash[:error] = 'Example has not been created.'
      render :new
    end
  end

  def update
    if @example.update(example_params)
      redirect_to @topic
    else
      render :edit
    end
  end


  private
    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def set_example
      @example = @topic.examples.find(params[:id])
    end

    def example_params
      params.require(:example).permit(:sentence, { hanyu_attributes: [:meaning, :pinyin, :slow_speaking, :normal_speaking] })
    end
end
