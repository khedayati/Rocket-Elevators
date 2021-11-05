 require File.expand_path(File.dirname(__FILE__) + '/../../config/environment.rb')
 require 'pg'

# # Establish a connection to the database data_warehouse.
# # Should work for all the namespace -> task included in the file.
# # db = ActiveRecord::Base.establish_connection(:data_warehouse)
# # ActiveRecord::Base.establish_connection(:development)
# # db = PG::connect.open( :port => '5432', :dbname => 'data_warehouse' , :user => 'yen', :password => 'password')
 connection = PG::Connection.new(host:'localhost',port:'5432',dbname:'data_warehouse',user:'yen',password:'password')

 puts "\e[0;36mCurrently connected to:\e[0m '" + ActiveRecord::Base.connection.current_database + "'"
 puts "\e[0;36mCurrently connected for PG to:\e[0m '" + connection.db + "'"

# # ActiveRecord::Base.logger = Logger.new(STDOUT)




 namespace :wh do
    task :reset do
        Rake::Task["wh:make_table"].invoke
        Rake::Task["wh:populate:quote"].invoke
        Rake::Task["wh:populate:contact"].invoke
        Rake::Task["wh:populate:elevator"].invoke
        Rake::Task["wh:populate:customer"].invoke
    end



     task make_table: :environment do
         connection.exec("DROP TABLE IF EXISTS public.fact_quotes")
         connection.exec("CREATE TABLE public.fact_quotes (creation_date date NULL,
         company_name varchar NULL,
         email varchar NULL,
         nb_elevator int4 NULL,
         quote_id serial NOT NULL,
         CONSTRAINT fact_quotes_pk PRIMARY KEY (quote_id))")
         print "CREATE FACT QUOTE TABLE: "
         puts "\e[0;32mOK\e[0m"

         connection.exec("DROP TABLE IF EXISTS public.fact_contacts")
         connection.exec("CREATE TABLE public.fact_contacts (creation_date date NULL,
         company_name varchar NULL,
         email varchar NULL,
         project_name varchar NULL,
         contact_id serial NOT NULL,
         CONSTRAINT fact_contact_pk PRIMARY KEY (contact_id))")
         print "CREATE FACT CONTACT TABLE: "
         puts "\e[0;32mOK\e[0m"


        connection.exec("DROP TABLE IF EXISTS public.fact_elevators")
        connection.exec("CREATE TABLE public.fact_elevators (date_of_commissionig date NULL,
        building_city varchar NULL,
        customer_id serial NOT NULL,
        building_id serial NOT NULL,
        serial_number serial NOT NULL,
        CONSTRAINT fact_elevator_pk PRIMARY KEY (serial_number))")
        print "CREATE FACT ELEVATOR TABLE: "
        puts "\e[0;32mOK\e[0m"

            

         connection.exec("DROP TABLE IF EXISTS public.dim_customers")
         connection.exec("CREATE TABLE public.dim_customers (creation_date date NULL,
         company_name varchar NULL,
         email varchar NULL,
         full_name varchar NULL,
         nb_elevator int4 NULL,
         customer_city varchar NULL)")
         print "CREATE DIM CUSTOMER TABLE: "
         puts "\e[0;32mOK\e[0m"
     end

     namespace :populate do
         task quote: :environment do
             Quote.all.each do |quote|
                 query = "insert into fact_quotes(quote_id,creation_date , company_name, email, nb_elevator ) values('#{quote.id}', '#{quote.created_at}',' #{"foo"}', '#{"bar"}', '#{quote.amount_elevators}')"
                connection.exec(query)
             end
             puts "POPULATE FACT QUOTE: " + "\e[0;32mOK\e[0m"
         end


        task contact: :environment do
            Lead.all.each do |contact|
                # query = "insert into fact_contacts(contact_id, creation_date, company_name, email, project_name) values('#{contact.id}', '#{contact.created_at}', '#{contact.company_name}', '#{contact.email}', '#{contact.project_name}')"
                query = "insert into fact_contacts(contact_id, creation_date, company_name, email, project_name) values('#{contact.id}', '#{contact.date_of_creation}', '#{contact.company_name}', '#{contact.email}', '#{contact.project_name}')"
                connection.exec(query)
            end
            puts "POPULATE FACT CONTACT: " + "\e[0;32mOK\e[0m"
        end
        task elevator: :environment do
            
            Address.all.each do |address|
            # puts Customer.find(1).to_json
            # puts address.buildings.to_json
                if address.buildings.exists? && address.customers.exists?
                    address.buildings.all.each do |building|
                        building.batteries.all.each do |battery|
                            # puts building.to_json
                            battery.columns.all.each do |column|
                                column.elevators.all.each do |elevator|
                                    # puts building.to_json
                                    # puts "test"
                                    # building.address_of_the_building
                                    query = "insert into fact_elevators(serial_number, date_of_commissionig, building_city, customer_id, building_id) values('#{elevator.id}', '#{elevator.Date_of_commissioning}', '#{address.city}', '#{address.customers.ids[0]}', '#{building.id}')"
                                    connection.exec(query)
                                end
                            end
                        end
                    end
                end
            end
            puts "POPULATE FACT ELEVATOR: " + "\e[0;32mOK\e[0m"
        end
        task customer: :environment do
            # puts Customer.find(1).to_json
            Address.all.each do |address|
                if address.customers.exists?
                    city = address.city
                    @customer = address.customers
                    # puts @customer.to_json
                    # puts Customer.find(1).to_json 
                    query = "insert into dim_customers(creation_date, company_name, full_name, email, nb_elevator, customer_city) values('#{@customer.customer_creation_date}', '#{@customer.company_name}', '#{@customer.full_name_of_the_company_contact}', '#{@customer.email_of_the_company_contact}', '#{address.city}')"
                    connection.exec(query)
                end
            end
            puts "POPULATE DIM CUSTOMER: " + "\e[0;32mOK\e[0m"
        end
    end
end

