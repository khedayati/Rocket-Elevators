require "net/http"
require "uri"
require "json"
class InterventionsController < InheritedResources::Base

  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end
  
  # GET /interventions/1 or /interventions/1.json
  def show
    @intervention = Intervention.new
  end


  # (idOfCustomer)
  def get_buildings
    @interventions = Intervention.all
    #@customers = Customer.all
    #@buildings = Building.all
    #@buildings = Building.where(customerId: params[:customer_id])

    #byebug
    #customer_buildings = Building.where(customer_id: @buildings)
    #customer_buildings = Building.where(customer_id: idOfCustomer) #
    
    #respond_to do |format|
    #  format.json { render json:  @customer_buildings }
    #end
    #@buildings = User.where(params[:id])
    @buildings = Building.where(customer_id: params[:idOfCustomer])
    render json: @buildings
  end

  def get_columns
    #@interventions = Intervention.all
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
    #@interventions = Intervention.all
    @elevators = Elevator.where(column_id: params[:idOfElevator]) # idOfElevator elevatorId
    render json: @elevators
  end

  # (_id)
  def interventions
    @interventions = Intervention.all
    @customers = Customer.all
    @customers = Battery.all
    @employees = Employee.all
    #@buildings = Building.all
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
  

    # POST /interventions or /interventions.json
  def create

    @intervention = Intervention.new(intervention_params)

    #@employee_first_name = current_user.first_name
    #@employee_last_name = current_user.last_name


    puts "params"
    puts params

    if @intervention.save
      puts "Successfully saved"
    else
      puts "Not saved"
    end

    respond_to do |format|
      if @intervention.save
        format.html { redirect_to root_path, notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
    @customer = Customer.find(@intervention.customer_id)
    @employee = Employee.find(@intervention.employee_id)
    puts "###########"
    # puts @intervention.customerId
    ZendeskAPI::Ticket.create!(@client,
      :subject => " from #{@customer.id}" ,
      :requester => {"name": @intervention.customer_id},
      :comment => { :value =>
      "Customer id: #{@customer.id},
       Building id: #{@intervention.building_id},
       Employee id: #{params[:employee_id]},
       Battery id: #{params[:battery_id]},
       Column id: #{params[:column_id]},
       Elevator id: #{params[:elevator_id]}
        Attached Message: "},
      :type => "question",
      :priority => "urgent")
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
