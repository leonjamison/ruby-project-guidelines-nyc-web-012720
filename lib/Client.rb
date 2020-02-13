class Client < ActiveRecord::Base 
    has_many :appointments 



    # New Member
    def self.create_new_client_account
        puts "---------------------------------------------------------"
        puts "ITS A MOVEMENT! Please Enter Your Name:"
        puts "---------------------------------------------------------"
        newuser_name = gets.chomp
        puts "---------------------------------------------------"
        puts "Please Enter Your Age?"
        puts "---------------------------------------------------"
        newuser_age = gets.chomp 
        new_client = Client.create(name:newuser_name, age:newuser_age)
        puts "---------------------------------------------------"
        puts "FIRST CUT ON US, LETS MAKE IT HAPPEN!!!"
        puts "---------------------------------------------------"


    end 

    #Delete Membership
    def self.delete_client_account
        puts "We Hate To See You Go! What is your name?"
        user_delete = gets.chomp 
        delete_user_account = Client.find_by(name: user_delete)
        delete_user_account == user_delete
        delete_user_account.destroy
        puts "---------------------------------------------------"
        puts "Join Us Anytime, We'd Love To Have You Back!!"
        puts "---------------------------------------------------"
       
    end 
        






end 