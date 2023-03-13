# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

  # Create Hotel
  Hotel.create(name: "The Grand Hotel",  city: "New York", address: "123 Main St.", phone_number: "5555555555")
  Hotel.create(name: "The Grand Hotel2", city: "New York", address: "123 Main St.", phone_number: "5555556666")
  Hotel.create(name: "The Grand Hotel3", city: "New York", address: "123 Main St.", phone_number: "5555557777")

  # Create Rooms
  Room.create(floor_number: "1", room_number: "101", max_capacity: 2, price: 1000.00,  hotel_id: 1)
  Room.create(floor_number: "2", room_number: "201", max_capacity: 4, price: 2000.00,  hotel_id: 1)
  Room.create(floor_number: "3", room_number: "301", max_capacity: 1, price: 5000.00,  hotel_id: 1)
  Room.create(floor_number: "4", room_number: "401", max_capacity: 1, price: 5000.00,  hotel_id: 1)

  # Create Roles
  Role.create(name_ar: "مدير الفندق",   name_en: "Hotel Manager", hotel_id: 1)
  Role.create(name_ar: "موظف الإستقبال", name_en: "Receptionist",  hotel_id: 1)


  # Create Employees
  Employee.create(first_name: "John", last_name: "Doe", email: "johndoe@example.com" , birthday: Date.new(1980, 1, 1), joining_date: Date.new(2000, 1, 1), salary: 5000.00, age: 42, hotel_id: 1, role_id: 1)
  Employee.create(first_name: "Jane", last_name: "Doe", email: "janedoe2@example.com", birthday: Date.new(1985, 2, 2), joining_date: Date.new(2010, 2, 2), salary: 6000.00, age: 37, hotel_id: 1, role_id: 2)

  # Create Guests
  Guest.create(full_name_en: "John Smith", full_name_ar: "جون سميث", id_card_number: "12345678", passport_number: "ABCD1234", mobile_number: "1234567890", email: "johnsmith@example.com",  birthday: Date.new(1990, 1, 1))
  Guest.create(full_name_en: "Ali Smith",  full_name_ar: "علي سميث", id_card_number: "87654321", passport_number: "DCBA4321", mobile_number: "1987654321", email: "janesmith2@example.com", birthday: Date.new(1995, 2, 2))

  # Create Bookings
  Booking.create(room_id: 1,  employee_id: 1, check_in_date: Date.new(2022, 1, 1), check_out_date: Date.new(2022, 1, 5), holder_id: 1, status: 2)
  Booking.create(room_id: 2,  employee_id: 2, check_in_date: Date.new(2022, 2, 1), check_out_date: Date.new(2022, 1, 6), holder_id: 1, status: 2)
  Booking.create(room_id: 3,  employee_id: 2, check_in_date: Date.new(2022, 2, 1), check_out_date: Date.new(2022, 1, 6), holder_id: 2, status: 2)
