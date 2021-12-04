require "net/http"
require "uri"
require "json"
class InterventionsController < InheritedResources::Base
  attr_accessor :date, :time, :start_date
  skip_before_action :verify_authenticity_token

  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end
  
  # GET /interventions/1 or /interventions/1.json
  def show
    @intervention = Intervention.new
  end

  def get_buildings
    @interventions = Intervention.all
    #byebug
    @buildings = Building.where(customer_id: params[:idOfCustomer])
    render json: @buildings
  end

  def get_columns
    @columns = Column.where(battery_id: params[:idOfColumn]) # idOfColumn columnId
    render json: @columns
    puts "COLUMNS"
    puts @columns
  end

  def get_batteries
    @interventions = Intervention.all
    @batteries = Battery.where(building_id: params[:idOfBuilding])
    render json: @batteries
  end

  def get_elevators
    @elevators = Elevator.where(column_id: params[:idOfElevator]) # idOfElevator elevatorId
    render json: @elevators
  end

  def interventions
    @interventions = Intervention.all
    @customers = Customer.all
    @customers = Battery.all
    @employees = Employee.all
    @buildings = Building.where(customerId: params[:customer_id])
    #byebug
    customer_buildings = Building.where(customer_id: 3)
    respond_to do |format|
      format.json { render :json => @customer_buildings }
    end
  end
  
  # GET /interventions/new
  def new
    @intervention = Intervention.new
  end

  def submit
    puts "params"
    puts params
    @employee_working = current_user.employee[0]
    @intervention = Intervention.new(
      customer_id: params[:customer_id],
      building_id: params[:building_id],
      battery_id: params[:battery_id],
      column_id: params[:column_id],
      employee_id: params[:employee_id],
      elevator_id: params[:elevator_id],
      author_id: current_user.employee[0].id
    )
    if @intervention.save
      puts "Successfully saved"
    else
      puts "Not saved"
    end

  end
  
  def dateCreationForm
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)
    #puts "params"
    #puts params
    #byebug
    respond_to do |format|
      if @intervention.save
        format.html { redirect_to root_path, notice: "" }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
    @customer = Customer.find(@intervention.customer_id)
    @employee = Employee.find(params[:employee_id])
    
    puts "###########"
    #byebug
    puts "\n\n\n\n"
    @dateCreation = params[:date]
    
    @start_date = @intervention.created_at
    
    @buildingChosen = Building.find(params[:building_id])
    
    @batteryChosen = Battery.find(params[:battery_id])
    
    @columnChosen = Column.find(params[:column_id])

    @elevatorChosen = Elevator.find(params[:elevator_id])

    @description_intervention = params[:report]
    
    ZendeskAPI::Ticket.create!(@client,
      :subject => " from #{@customer.full_name_of_the_company_contact}, #{@customer.id}" ,
      :requester => "name : #{@customer.full_name_of_the_company_contact}",
      :comment => { :value =>
      "Customer id: #{@customer.id},
       Building id: #{@buildingChosen.id},
       Employee id: #{@employee.id},
       Employee first name: #{@employee.first_name},
       Employee last name: #{@employee.last_name},
       Battery id: #{@batteryChosen.id},
       Column id: #{@columnChosen.id},
       Elevator id: #{@elevatorChosen.id}
       Attached Message: #{@description_intervention} "},
      :type => "question",
      :priority => "urgent")

    if @intervention.save
      puts "Successfully saved"
    else
      puts "Not saved"
    end

  end
  
  # GET /interventions/
  #def submit

  #end
  #def name_with_initial
  #  "#{first_name.first}. #{last_name}"
  #end
  # GET /quotes/1/edit
  def edit; end


  private

    def intervention_params
      params.permit(:author_id, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :start_date, :end_date, :result, :report, :status, :intervention)
    end
    # .require(:intervention)
end
