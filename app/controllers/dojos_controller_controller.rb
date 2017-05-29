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

  def show
      @dojo = Dojo.find(params[:id])
      @students = @dojo.students
  end

  def edit
      @dojo = Dojo.find(params[:id])
  end

  def update
      @dojo = Dojo.find(params[:id])
      @dojo.assign_attributes(dojo_params)
      if @dojo.valid?
          @dojo.save
          redirect_to "/dojos"
      else
          flash[:errors] = @dojo.errors.full_messages
          redirect_to url_for :controller => "dojos_controller", :action => "edit"
      end
  end


  def destroy
      @dojo = Dojo.find(params[:id]).destroy
      flash[:success] = "Dojo deleted"
      redirect_to "/dojos"
  end

  private
    def dojo_params
        params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
