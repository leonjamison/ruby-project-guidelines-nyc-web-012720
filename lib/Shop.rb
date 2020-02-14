class Shop < ActiveRecord::Base 
    has_many :barbers
    
    
    # User can create new shop
    def self.new_shop
        # askes user for a name
        puts "------------------------------------------"
        puts "Please Enter New Shop Name"
        puts "------------------------------------------"
        # saves given name in variable
        given_name = gets.chomp
        puts "----------------------------------------------"
        # askes user for name of city 
        puts "Please Enter The City The New Shop Is Located"
        puts "----------------------------------------------"
        # saves user into into given_location 
        given_location = gets.chomp
        # takes given argument of shop name and location to create new shop in database 
        new_shop = Shop.create(name: given_name, location: given_location)
        puts "------------------------------------------"
        puts "New Shop Added, GIT THIS MONEY!!"
        puts "------------------------------------------"
    end 

    # User can see a list of all barbers at a specific shop (ASSUMED USER KNOW THE NAME OF SHOP THERE INTERESTED IN)
    def self.list_barbers_by_shop
        # askes user for name of shop there searching for 
        puts "---------------------------------------------------------------------"
        puts "Please Enter The Name Of SHOP For Which You'd Like To See All Barbers"
        puts "---------------------------------------------------------------------"
        # saves user input into variable user_shop_input 
        user_shop_input = gets.chomp
        # then we interate through shop table to find specific name(user input) and saves the method to variable. 
        # then we search through Barber table to find where shop_id is equal to given shop id
        # using if,else statement, I use string interpolation, if true, to return selected barber attributes 
        if chosen_shop = Shop.find_by(name:user_shop_input)
             barber_list = Barber.where("shop_id = ?", chosen_shop.id)
                barber_list.each{|barber| puts "NAME: #{barber.name} - EXPERIENCE(YRS): #{barber.experience} - STYLE: #{barber.style} - PRICE($): #{barber.price}"}
        else
            puts "NO SHOP FOUND, PLEASE CONFIRM NAME OF SHOP!!"
        end 
    end 

    # User can see a list of all affiliated shops
    # I interate through shop table using .each to return only the name and location of all shop objects
    def self.list_of_shops
        puts "------------------------------------------"
        Shop.all.each{|shop| puts "NAME: #{shop.name} - LOCATION: #{shop.location}"}
        puts "------------------------------------------"
    end 

   #User can list shops by city
    def self.list_shops_by_city
        prompt = TTY::Prompt.new
    #    map through shop table to pull all shop locations into a menu 
        shop_location = Shop.all.map{|shop| shop.location }
        # I add .uniq to ensure no city dublicates itself as new shops are added to the same city 
        location = prompt.select("Choose a city", shop_location.uniq)
        # I interate through using .select in the shop, verifying if given location exist and store it into an array 
        location_array = Shop.all.select{|shop_obj| shop_obj.location == location }
        puts "---------------------------------"
        puts "Here's Where We Are CHOPPIN IT UP At:"
        puts "---------------------------------"
        # iterate through saved array above using .each and puts the shop object name for selected city 
        shop_name = location_array.each{ |shop_obj| puts shop_obj.name }
        
        #  binding.pry

    end 

   






end 