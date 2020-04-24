class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all

  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @city = City.all

     # For show all MAnager 
    manager_id = Employee.pluck(:manager_id)
    @manager_subordinate = manager_id.each_with_object(Hash.new(0)) { |subordinate,counts| counts[subordinate] += 1 }.select { |k,v| v>=1 }


    # For Show all subordinate
    @subordinate = Employee.where(:manager_id => params[:id]);
    

  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @city = City.all
  end

  # GET /employees/1/edit
  def edit
     @city = City.all
     
  end


  def relocation_requests
    @relocation_emp = Employee.where(willing_to_relocate: true)

  end

  def city_update
    
    @city_select = City.find(params[:select_city])

    @c = @city_select.employees.count

    respond_to do |format|
      format.js
      format.html
    end
  end

  def manager
    manager_id = Employee.pluck(:manager_id)

    @city = City.all
    # @subordinate_count = manager_id.tally
    
    @manager_subordinate = manager_id.each_with_object(Hash.new(0)) { |subordinate,counts| counts[subordinate] += 1 }.select { |k,v| v>=1 }

    # @subordinate_count = manager_subordinate.values

    @manager_emp = Employee.where(id: manager_id).paginate(:page => params[:page], :per_page => 5)

  end

  # POST /employees
  # POST /employees.json
  def create
    
    @employee = Employee.new(employee_params)
    @city = City.all

    # Employee.user_new_joining(params[:willing_to_relocate])
    # @employee.willing_to_relocate = params[:willing_to_relocate]

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      # @employee.willing_to_relocate = params[:willing_to_relocate]

      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:name, :manager_id, :city_id, :willing_to_relocate,:image)
    end
end
