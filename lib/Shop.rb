class Shop < ActiveRecord::Base 
    has_many :barbers
    
    
    # User can create new shop
    def self.new_shop
        puts "------------------------------------------"
        puts "Please Enter New Shop Name"
        puts "------------------------------------------"
        given_name = gets.chomp
        puts "----------------------------------------------"
        puts "Please Enter The City The New Shop Is Located"
        puts "----------------------------------------------"
        given_location = gets.chomp
        new_shop = Shop.create(name: given_name, location: given_location)
        puts "------------------------------------------"
        puts "New Shop Added, GIT THIS MONEY!!"
        puts "------------------------------------------"
    end 

    # User can see a list of all barbers at a specific shop
    def self.list_barbers_by_shop
        puts "---------------------------------------------------------------------"
        puts "Please Enter The Name Of Shop For Which You'd Like To See All Barbers"
        puts "---------------------------------------------------------------------"
        user_shop_input = gets.chomp
        chosen_shop = Shop.find_by(name:user_shop_input)
        barber_list = Barber.where("shop_id = ?", chosen_shop.id)
        pp barber_list
        
    end 

    # User can see a list of all affiliated shops
    def self.list_of_shops
        puts "------------------------------------------"
        pp Shop.all
        puts "------------------------------------------"
    end 

   #User can list shops by city
    def self.list_shops_by_city
        prompt = TTY::Prompt.new
       
        shop_location = Shop.all.map{|shop| shop.location }
        location = prompt.select("Choose a city", shop_location)
        location_array = Shop.all.select{|shop_obj| shop_obj.location == location }
        puts "---------------------------------"
        puts "Here's Where We Are CHOPPIN IT UP At:"
        puts "---------------------------------"
        shop_name = location_array.each{ |shop_obj| puts shop_obj.name }
        
        #  binding.pry

    end 

   






end 