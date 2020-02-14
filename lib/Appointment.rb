class Appointment < ActiveRecord::Base
    belongs_to :barber
    belongs_to :client 



    #Book an appointment (IT IS ASSUME USER KNOW BARBER NAME AND SHOP NAME BEFORE MAKING APPOINTMENT)
    def self.new_appointment
        prompt = TTY::Prompt.new
   
       #ask for client id
        new_appointment_id_name = prompt.ask("Please Enter Your Name:")
        affiliated_client = Client.find_by(name: new_appointment_id_name)
        input_id = affiliated_client.id 

        # ask for date
       selected_date = prompt.ask("Please Enter Appointment Date (MMDDYYYY):") 

        #ask for time
       selected_time = prompt.ask("Please Enter Appointment Time (HHMM-24HrFormat):")

        #ask for shop
        found_shop = nil
        while found_shop == nil
            selected_spot = prompt.ask("Please Enter Name of Shop:")
            found_shop = Shop.find_by(name: selected_spot)
            if found_shop != nil && found_shop.name == selected_spot
                puts "Shop Confirmed.."
            else
                puts "Please Enter Valid Shop (See - Search For Shop By City - For Help)!"
            end
        end

        #ask for barber id: Method finds name then find barber_id based on that name. 
        chosen_barber_name_id = prompt.ask("For Which Barber Would You Like to Book?")
        found_barber_name = Barber.find_by(name: chosen_barber_name_id)
        if found_barber_name.name == chosen_barber_name_id
            chosen_barber = found_barber_name.id
            new_appointment = Appointment.create(date: selected_date, time: selected_time, client_id: input_id, barber_id: chosen_barber)

            puts "-----------------------------------------------------------------------"
            puts "LETS GET FRESH!!!"
            puts "Appointment Confirmed, Please Check-In 10 Minutes Prior To Reservation"
            puts "-----------------------------------------------------------------------"
        else
            puts "NO BARBER FOUND..PLEASE CONFIRM BARBER (SEE MENU - LIST OF BARBERS BY SHOP - FOR HELP)"

        end 



    end 


    #See list of all specific client appointments (CLIENT MUST EXIST BEFORE SEEING APPOINTMENTS)
    def self.list_selected_client_appointments
        prompt = TTY::Prompt.new
        selected_client_name = prompt.ask("PLEASE ENTER YOUR NAME:")
        find_appointment_array = Appointment.where('client_id = ?', Client.find_by(name: selected_client_name).id)
        find_appointment_array
            puts "HERES A LIST OF ALL OF YOUR APPOINTMENTS:"
            find_appointment_array.each{|appointment| puts "DATE: #{appointment.date} - TIME: #{appointment.time} - BARBER: #{appointment.barber.name}"}
        
    end 

    #cancel appointment 
    def self.cancel_appointment
        prompt = TTY::Prompt.new
    
        find_appointment = self.list_selected_client_appointments
        user_date_input = prompt.ask("PLEASE ENTER APPOINTMENT DATE FOR WHICH YOU'D LIKE TO CANCEL:")
        user_time_input = prompt.ask("PLEASE ENTER APPOINTMENT TIME FOR THAT DAY:")
        Appointment.find_by(date: user_date_input , time: user_time_input).destroy
            puts "Your Appoinment Has Been Cancelled!"
    end 

    def self.update_appointment
        prompt = TTY::Prompt.new

        new_update = self.list_selected_client_appointments
        previous_date = prompt.ask("PLEASE ENTER APPOINTMENT DATE FOR WHICH YOU'D LIKE TO UPDATE:")
        previous_time = prompt.ask("PLEASE ENTER APPOINTMENT TIME YOU'D LIKE TO UPDATE:")
        updated_appointment = Appointment.find_by(date: previous_date , time: previous_time)
        updated_date = prompt.ask("PLEASE ENTER NEW APPOINTMENT DATE:")
        updated_time = prompt.ask("PLEASE ENTER NEW APPOINTMENT TIME:")
        updated_appointment.update(date: updated_date, time: updated_time)
        puts "-----------------------------------------------------------------------"
        puts "LETS GET FRESH!!!"
        puts "Appointment UPDATED, Please Check-In 10 Minutes Prior To Reservation"
        puts "-----------------------------------------------------------------------"
       



    end 



end 