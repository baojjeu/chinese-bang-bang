class ExamplesController < ApplicationController
  before_action :set_topic

  def new
    @example = @topic.examples.build
    @example.build_hanyu
  end

  def edit
    @example = @topic.examples.find(params[:id])
  end

  def create
    @example = @topic.examples.new(example_params)
    if @example.save
      redirect_to @topic,
                  flash: { success: 'Example is succesfully created.' }
    else
      flash[:error] = 'Example has not been created.'
      render :new
    end
  end

  private
    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def example_params
      params.require(:example).permit(:sentence, { hanyu_attributes: [:meaning] })
    end
end
