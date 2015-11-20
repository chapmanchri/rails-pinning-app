class PinsController < ApplicationController

  def index
    @pins = Pin.all
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def show_by_name
    @pin = Pin.find_by_slug(params[:slug])
    render :show
  end

  def new
    @pin = Pin.new
  end

  def create
    # puts "in def create"
    @pin = Pin.create(pin_params)
    # puts "the title should be: #{@pin.title}"
    # puts "in create 1"
    # @pin.save
    # puts "in create SAVE"
    # # redirect_to pins_path
    # redirect_to pin_by_name_path(slug: @pin.slug)

    respond_to do |format|
      if @pin.save
        puts "in save"
        format.html { redirect_to @pin, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        puts "in not save"
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end

  end

  private

  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :category_id)
  end

end
