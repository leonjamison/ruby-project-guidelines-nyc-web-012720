class Barber < ActiveRecord::Base
    has_many :appointments 
    has_many :clients, through: :appointments
    belongs_to :shop


    #See a list of all affiliated Barbers
    def self.list_of_barbers
        puts "------------------------------------------"
        Barber.all.each{|barber| puts "NAME: #{barber.name} - SHOP: #{barber.shop.name}"}
        puts "------------------------------------------"
    end

    def self.remove_barber
        puts "---------------------------------------------------------------"
        puts "Hate To See You Go! Please Enter Barbers Name:"
        puts "---------------------------------------------------------------"
        userinput_remove_barber = gets.chomp
        lets_remove_barber = Barber.find_by(name:userinput_remove_barber)
        lets_remove_barber == userinput_remove_barber
         lets_remove_barber.destroy
        puts "-----------------------------------------------------"
        puts "We Will Always Welcome You Back, KEEP CHOPPIN IT UP!!!"
        puts "-----------------------------------------------------"   
         

    end 

    #User can add new barber (ASSUMED BARBER KNOWS WHAT BARBER THEY WILL BE WORKING FOR)
    def self.add_new_barber
        prompt = TTY::Prompt.new
        #ask for name
        new_barber = prompt.ask("LETS GIT TO THE BAG!! What Is Your Name?")
        #ask for experience
        years_of_experience = prompt.ask("Years Of Experience? (Enter 0 If Less Than a Year)") 
        #ask for style
        barber_style = prompt.ask("Name Specialized Style of Cutting:")
        #ask for price
        barber_price = prompt.ask("What Is Your Rate (Please Enter Whole $ Amount)?")
        input_barber_price = barber_price
        #ask for shop
        new_barber_location = prompt.ask("At What Shop Can We Find You?")
        affiliated_shop = Shop.find_by(name: new_barber_location)
        input_location = affiliated_shop.id

        #Takes in above input and creates new barber
        add_new_barber = Barber.create(name: new_barber, experience: years_of_experience, style: barber_style, price: input_barber_price, shop_id: input_location)
        puts "---------------------------------------"
        puts "LETS CHOPP IT UP...GIT THIS MONEY!!!"
        puts "---------------------------------------"

    end 



   



    


end 