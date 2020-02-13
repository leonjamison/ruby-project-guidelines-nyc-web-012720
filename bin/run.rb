require_relative '../config/environment'




def start
    prompt = TTY::Prompt.new
    puts "---------------------------------------------"
    puts "WELCOME To CHOPP IT UP 2020!!!"
    puts "---------------------------------------------"
    puts "Please Enter Username (Account Holders Name):"
 
    user_name = gets.chomp
    prompt = TTY::Prompt.new
    password = prompt.mask("Please enter password (New User Enter 0000):")
    
    run 
    
   
end

    def run


        prompt = TTY::Prompt.new(active_color: :cyan)
        # system('clear')
        puts "-------------------------------------------------------------"
        prompt.select("LETS GET YOU FRESH, Please Make A Selection Below:") do |menu|

            menu.choice "Create New Account" do
                Client.create_new_client_account
                run
            end
           
            menu.choice "Book An Appointment" do
                Appointment.new_appointment 
                run
            end 

            menu.choice "Cancel Appointment" do
                Appointment.cancel_appointment
                run
            end   
           
            menu.choice "See List Of Participating Shops" do
                Shop.list_of_shops
                run
            end

            menu.choice "Search For Shop By City" do
                Shop.list_shops_by_city
                run
            end 

            menu.choice "Search For Barber By Shop" do
                Shop.list_barbers_by_shop
                run
            end 

            menu.choice "See Appointment List (Administrator)" do 
                Appointment.list_of_appointments
                run
             end 

            menu.choice "Join The Movement (Shop Owner)" do
                Shop.new_shop
                run
            end

            menu.choice "Join The Movement (Barber)" do
                Barber.add_new_barber
                run
            end

            menu.choice "Delete Business Account (Barber)" do
                Barber.remove_barber
                run
            end

            menu.choice "Delete Account" do
                Client.delete_client_account
                run
            end


            menu.choice "Exit" do
                exit!
            end
        end
    end 
start




# **** METHODS PER CLASS ****

# SHOPS
# Shop.new_shop
#  Shop.list_barbers_by_shop
#  Shop.list_of_shops
#  Shop.list_shops_by_city

# BARBER
# Barber.add_new_barber
# Barber.list_of_barbers
# Barber.remove_barber

# APPOINTMENT
# Appointment.new_appointment
# Appointment.cancel_appointment
# Appointment.list_of_appointments 

# CLIENT
# Client.create_new_client_account
# Client.delete_client_account





