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

  def get_batteries
    @interventions = Intervention.all
    @batteries = Battery.where(building_id: params[:idOfBuilding])
    render json: @batteries
  end

  # (_id)
  def interventions
    @interventions = Intervention.all
    @customers = Customer.all
    @customers = Battery.all
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
  

    # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)
    respond_to do |format|
      if @intervention.save
        format.html { redirect_to root_path, notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
    puts "###########"
    puts "@intervention.author "
    puts @intervention.author
    puts "@intervention.customerId "
    puts @intervention.customerId
    # puts @intervention.customerId
    ZendeskAPI::Ticket.create!(@client,
      :subject => "#{@intervention.customerId} from #{@intervention.author}",
      :requester => {"name": @intervention.customerId},
      :comment => { :value =>
      "The contact #{@intervention.author} from company can be reached at #{@intervention.buildingId} and at #{@intervention.columnId}. #{@intervention.employeeId} has a project named #{@intervention.elevatorId} which would require contribution from Rocket Elevators.
        Attached Message: #{@intervention.report}"},
      :type => "question",
      :priority => "urgent")
  end
  
  # GET /interventions/
  def submit

  end
  #def name_with_initial
  #  "#{first_name.first}. #{last_name}"
  #end
  # GET /quotes/1/edit
  def edit; end


  private

    def intervention_params
      params.permit(:author, :customerId, :buildingId, :batteryId, :columnId, :elevatorId, :employeeId, :start_date, :end_date, :result, :report, :status)
    end
    # .require(:intervention)
end
