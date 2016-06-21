class ChatController < WebsocketRails::BaseController
  around_action :output_log
  
#  def initialize_session
    # controller_store[:message_count] = 0
#    puts "aaaaaaaaaaaaaa"
#  end

  def new_message
    recieve_message = message()
    broadcast_message(:new_message, recieve_message)
  end

private
  def output_log 
    puts "### start action"
    yield
    puts "### end action"
  end
end
