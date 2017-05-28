class DojosControllerController < ApplicationController
  def index
      @dojos = Dojo.all
  end

  def new
  end

  def create
      @dojo = Dojo.new(dojo_params)
      if @dojo.valid?
          @dojo.save
          flash[:success] = "Thanks for submitting this form!"
          redirect_to "/dojos"
      else
          flash[:errors] = @dojo.errors.full_messages
          redirect_to "/dojos/new"
      end
  end

  def update
      @dojo = Dojo.find(params[:id])
      @dojo.update(dojo_params)
  end

  private
    def dojo_params
        params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
