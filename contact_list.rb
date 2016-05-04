require_relative 'contact'


class ContactList

 
  def initialize


      if ARGV.empty?
          puts "Here is a list of available commands : 
          new     - Create a new contact
          list    - List all contacts 
          show    - Show a contact
          search  - Search contacts"
      end

      case ARGV[0]
        
        when "list"
          Contact.all.each{|x| puts x.name + x.email}
        

        when "show"
          
          user_input3 = ARGV[1]
          puts Contact.find(user_input3)




        when "new"
          puts "Please enter name and email separated with a blank space"
          user_input1 = $stdin.gets.chomp
          user_input2 = $stdin.gets.chomp
          Contact.create(user_input1, user_input2)

        when "search"
          user_input4 = ARGV[1]
          puts Contact.search(user_input4)
       
        else 
          unless ARGV.empty?
          puts "error, please type a correct type"
          end
        
      end

  end
end



MyClass = ContactList.new
  



