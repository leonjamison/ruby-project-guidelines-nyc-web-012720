class Appointment < ActiveRecord::Base
    belongs_to :barber
    belongs_to :client 




    def self.new_appointment
        prompt = TTY::Prompt.new
        #ask for name 
       client_name = prompt.ask("Please Enter Your Name:")
        # ask for client id
        input_client_id = prompt.ask("Please Enter Your Client Id Number (See Client Profile If Id Is Unknown):")
        #ask for date
       selected_date = prompt.ask("Please Enter Appointment Date (MMDDYYYY):") 
        #ask for time
       selected_time = prompt.ask("Please Enter Appointment Time (HHMM-24HrFormat):")
        #ask for barber id
        chosen_barber = prompt.ask("For Which Barber Id Would You Like to Book With (Please See Barber Profile If ID Is Unknown)?")
        #create new appointment 
        new_appointment = Appointment.create(date: selected_date, time: selected_time, client_id: input_client_id, barber_id: chosen_barber)
        
        puts "-----------------------------------------------------------------------"
        puts "LETS GET FRESH!!!"
        puts "Appointment Confirmed, Please Check-In 10 Minutes Prior To Reservation"
        puts "-----------------------------------------------------------------------"

    end 

    def self.list_of_appointments
        puts "----------------------------------------------"
        pp Appointment.all
        puts "----------------------------------------------"
    end 



    def self.cancel_appointment
        prompt = TTY::Prompt.new
        #ask for appointment ID
        user_input = prompt.ask("Enter Appointment ID You'd Like To Cancel (See Your Appointments If ID Is Unknown):")
        cancel_session = Appointment.find(user_input) 
            cancel_session.destroy 
        puts "Your Appoinment Has Been Cancelled!"
       
    end 




end 