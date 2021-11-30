class InterventionsController < InheritedResources::Base

  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end
  
  # GET /interventions/1 or /interventions/1.json
  def show
    @intervention = Intervention.new
  end



  def interventions
    @interventions = Intervention.all
    @customers = Customer.all
    @buildings = Building.all
  end
  
  # GET /interventions/new
  def new
    @intervention = Intervention.new
    #@customers = Customer.all.collect { |c| [ c.full_name_of_the_company_contact, c.id ] }
    #@buildings = Building.all.collect { |b| [ b.full_name_of_the_building_administrator, c.id ] }
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
