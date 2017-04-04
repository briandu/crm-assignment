require_relative 'contact.rb'

class CRM

  # puts "Welcome to CRM. What would you like to do?"


  def initialize
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then abort("Have a nice day!")
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    contact_display = Contact.create(first_name, last_name, email, note)
    puts "ID: #{contact_display.id} | Name: #{contact_display.first_name} #{contact_display.last_name} | Email: #{contact_display.email} | Note: #{contact_display.note}"

  end

  def modify_existing_contact

  end


  def delete_contact
    print "Enter the contact's ID: "
    Contact.delete
  end

  def display_all_contacts

    Contact.all.each do |contact_display_all|
    puts "ID: #{contact_display_all.id} | Name: #{contact_display_all.first_name} #{contact_display_all.last_name} | Email: #{contact_display_all.email} | Note: #{contact_display_all.note}"
    end

  end

  def search_by_attribute
    print_search_menu
    user_selected = gets.to_i
    search_options(user_selected)
  end

  def print_search_menu
    puts "What attribute would you like to search by?"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] Note"

    puts "Enter a number: "
  end

  def search_options(user_selected)
    case user_selected
      when 1 then
        attribute = "first_name"
      when 2 then
        attribute = "last_name"
      when 3 then
        attribute = "email"
      when 4 then
        attribute = "note"
    end

    puts "What do you want to search"
      user_input = gets.chomp
      match_found = Contact.find_by(attribute, user_input)
        puts "ID: #{match_found.id} | Name: #{match_found.first_name} #{match_found.last_name} | Email: #{match_found.email} | Note: #{match_found.note}"
  end

end



acc = CRM.new
acc.main_menu

# def add_new_contact
#     print 'Enter First Name: '
#     first_name = gets.chomp
#
#     print 'Enter Last Name: '
#     last_name = gets.chomp
#
#     print 'Enter Email Address: '
#     email = gets.chomp
#
#     print 'Enter a Note: '
#     note = gets.chomp
#
#
#     Contact.create(first_name, last_name, email, note)
#   end
#
#   def modify_existing_contact
#     puts "Please enter the ID of the contact you wish to modify"
#     userid = gets.to_i
#
#     if Contact.find(userid) == false
#       puts "Contact not found!"
#     else
#
#     puts "What do you want to modify?"
#     puts '[1] First name'
#     puts '[2] Last name'
#     puts '[3] Email'
#     puts '[4] Note'
#     numbatt = gets.to_i
#
#     case numbatt
#       when 1
#         attribute = "first_name"
#       when 2
#         attribute = "last_name"
#       when 3
#         attribute = "email"
#       when 4
#         attribute = "note"
#     end
#
#     puts "What do you want to set it to?"
#     value = gets.chomp
#
#     Contact.find(userid).update(attribute, value)
#   end
#   end
#
#   def delete_contact
#     puts "Please enter the ID of the contact you wish to delete"
#     userid = gets.to_i
#     Contact.find(userid).delete
#   end
#
#
#
#
#
#   def display_all_contacts
#     Contact.all.each do |contact|
#       puts "ID: #{contact.id} | Name: #{contact.first_name} #{contact.last_name} | Email: #{contact.email} | Note: #{contact.note}"
#     end
#   end
#
#
#
#
#
#   def search_by_attribute
#     puts "What do you want to search by?"
#     puts '[1] First name'
#     puts '[2] Last name'
#     puts '[3] Email'
#     puts '[4] Note'
#     numbatt = gets.to_i
#
#     case numbatt
#       when 1
#         attribute = "first_name"
#       when 2
#         attribute = "last_name"
#       when 3
#         attribute = "email"
#       when 4
#         attribute = "note"
#     end
#
#     puts "What do you want to search"
#     value = gets.chomp
#     foundcontact = Contact.find_by(attribute, value)
#       puts "ID: #{foundcontact.id} | Name: #{foundcontact.first_name} #{foundcontact.last_name} | Email: #{foundcontact.email} | Note: #{foundcontact.note}"
#   end
#
#   a_crm_app = CRM.new
#   a_crm_app.main_menu
#
# end
# Contact GitHub API Training Shop Blog About
