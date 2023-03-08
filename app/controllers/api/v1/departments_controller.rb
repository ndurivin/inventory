class Api::V1::DepartmentsController < ApplicationController
 
  def index
    departments = Department.all
    render json: departments, status: 200
  end

  def show
    department = Department.find_by(id: params[:id])
    if department
      render json: department, status: 200
    else
      render json: {
        error: "Department not found.."
      }
    end
  end

  def create
    department = Department.new(
      name: department_params[:name]
    )
    if Department.save
      render json: department, status: 200
    else
      render json: {
        error: 'Error creating Department...'
      }
    end
  end

  def update
    department = Department.find_by(id: params[:id])
    if department
      department.update(name: params[:name])
       render json: "Department updated successfully"
    else
      render json: {
        error: "Department not found"
      }
    end
  end

  def destroy
    department = Department.find_by(id: params[id])
    if department
      Department.destroy
      render json: "Department deleted successfully"
    end
  end

  private
  def department_params
    params.require(:department).permit([:name])
  end
end
