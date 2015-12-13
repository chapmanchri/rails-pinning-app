class PinsController < ApplicationController
  #before_action :require_login, except: [:show, :show_by_name, :index]
  before_action :require_login, except: [:show, :show_by_name]


  def index
    @pins = Pin.where(user_id: current_user.id)
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
    @pin = Pin.create(pin_params)

    if @pin.valid?
      @pin.save
      flash[:success] = "This pin has just been created."
      redirect_to pin_path(@pin)
    else
      @errors = @pin.errors
      render :new
    end
  end

  def edit
    @pin = Pin.find(params[:id])
  end

  def update
    @pin = Pin.find(params[:id])
    if @pin.update_attributes(pin_params)
      flash[:success] = "This pin has just been updated."
      redirect_to pin_path(@pin)
    else
      render :edit
    end
  end


  private

  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image, :user_id)
  end

  # def require_login
  #   if current_user.nil?
  #     redirect_to :login
  #   end
  # end

end
