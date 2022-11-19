class EmployeesController < ApplicationController
  def new
    @employment = Employment.new
  end
  
  def create
    @employee = Employee.new(employment_params)
    respond_to do |format|
      if @employee.save
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('employments', partial: 'employments/employment', locals: {employments: @employee.employments}) }
        format.html { redirect_to employees_url(@employment), notice: "Employment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def employment_params
      params.require(:employee).permit(employments_attributes: [:employeer, :date_started, :date_employment_ended])
    end
end
