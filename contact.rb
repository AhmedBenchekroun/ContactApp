require 'csv'
contact = CSV.read("contact.csv")



class Contact

  attr_accessor :name, :email, :id
  def initialize(name, email, id)
    @name = name
    @email = email
    @id = id
  end

  
  class << self


    
    
  def all
      
    empty_array =[]
    CSV.foreach("contact.csv") do |row| 
    empty_array.push(Contact.new(row[0], row[1]))
    end

    return empty_array
  end

  def new_id
    contact_array =[]

    CSV.foreach("contact.csv") do |row| 
    contact_array.push(Contact.new(row[0], row[1], row[2]))
    end

    contact_array.last.id.to_i + 1
  end

    
    
    
  def create(name, email)
      
    id = new_id
    new_contact = [name, email, id]

    CSV.open("contact.csv", "a") do |csv|
      csv << new_contact
    end

    Contact.new(name, email,id)

  end
    
    
    
    
  def find(user_input3)

    result = []
    
    CSV.foreach("contact.csv") do |row| 
      result.push(row) if row[2].to_i == user_input3.to_i 
    end
    result
  end
    
    
  def search(user_input4)
      result = []
    
    CSV.foreach("contact.csv") do |row| 
      result.push(row) if row[0].include?(user_input4)|| 
      row[1].include?(user_input4) ||
      row[2].include?(user_input4)
    end
    result
  end



  end

end