class DepartmentsController < ApplicationController

  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def show
  end

  def new
    @department = Department.new
  end
  
  def create
    @department = Department.new(department_params)

    if @department.save
      respond_to do |format|
        format.html { redirect_to departments_url, notice: "Department successfully created..." }
        format.turbo_stream {}
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @department.update(department_params)
      respond_to do |format|
        format.html { redirect_to departments_url, notice: "Department successfully updated..." }
        format.turbo_stream {}
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @department.destroy
    redirect_to departments_url, notice: "Department successfully deleted..."
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:title, :notes)
  end
end
