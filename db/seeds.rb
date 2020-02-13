


shop1 = Shop.create(name: "Fadish", location: "New York")
shop2 = Shop.create(name: "Clean Cuts", location: "Los Angelos")
shop3 = Shop.create(name: "Black and Gold", location: "Denver")

barber1 = Barber.create(name: "Bill", experience: 5, style: "Ceasar", price: 20, shop_id: 1)
barber2 = Barber.create(name: "Chicago", experience: 3, style: "Bald", price: 25, shop_id: 2)
barber3 = Barber.create(name: "Raymond", experience: 4, style: "Drop Fade", price: 25, shop_id: 3)
barber4 = Barber.create(name: "Ramzy", experience: 7, style: "High and Tight", price: 35, shop_id: 1)
barber5 = Barber.create(name: "David", experience: 2, style: "Mohawk", price: 15, shop_id: 1)

client1 = Client.create(name: "Sam", age: 24)
client2 = Client.create(name: "Mike", age: 30)
client3 = Client.create(name: "Jack", age: 14)

appointment1 = Appointment.create(date:02062020, time: 1300, client_id: 1, barber_id:1)
appointment2 = Appointment.create(date:02102020, time: 1500, client_id: 2, barber_id:2)
appointment3 = Appointment.create(date:02112020, time: 1000, client_id: 3, barber_id:3)



