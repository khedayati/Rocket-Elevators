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