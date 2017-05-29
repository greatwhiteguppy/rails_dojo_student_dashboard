class StudentsController < ApplicationController
  def index
  end

  def new
      @dojos = Dojo.all
      @dojo = Dojo.find(params[:dojo_id])
  end

  def create
      @dojo = Dojo.find(params[:dojo_id])
      @student = Student.new(student_params)
      if @student.valid?
          @student.save
          flash[:success] = "Student successfully added!"
          redirect_back(fallback_location: "/dojos")
      else
          flash[:errors] = @student.errors.full_messages
          redirect_to  url_for :controller => "students", :action => "new"
      end
  end

  def show
      # don't need dojo here - can just connect to @student.branch
      @student = Student.with_dojo(params[:id])
      @cohort = Student.cohort(@student)
  end

  def edit
      @dojos = Dojo.all
      @student = Student.find(params[:id])
  end

  def update
      @student = Student.find(params[:id])
      @student.assign_attributes(student_params)
      if @student.valid?
          @student.save
          flash[:success] = "Student successfully updated!"
          redirect_back(fallback_location: "/dojos")
      else
          flash[:errors] = @student.errors.full_messages
          redirect_to  url_for :controller => "students", :action => "edit"
      end
  end

  def destroy
      Student.find(params[:id]).destroy
      flash[:success] = "Student deleted"
      redirect_back(fallback_location: "/dojos")
  end

  private
    def student_params
        params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    end
end
