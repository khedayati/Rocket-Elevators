class InterventionsController < InheritedResources::Base

  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end
  
  # GET /interventions/1 or /interventions/1.json
  def show
    @intervention = Intervention.new
  end



  def interventions(_id)
    @interventions = Intervention.all
    @customers = Customer.all
    #@buildings = Building.all
    @buildings = Building.where(customerId: params[:customer_id])

    byebug
    customer_buildings = Building.where(customer_id: _id)
    

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
      params.require(:intervention).permit(:author, :customerId, :buildingId, :batteryId, :columnId, :elevatorId, :employeeId, :start_date, :end_date, :result, :report, :status)
    end

end
