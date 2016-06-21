class ChatController < WebsocketRails::BaseController
  around_action :output_log
  
	def initialize_session
    	puts "### Session Initialized\n"
  end
	
  def new_message
  	  puts "### call new_message: #{message}"
	    broadcast_message :new_message, message
	end

private

  def output_log 
    puts "### start action"
    yield
    puts "### end action"
  end
  
end
