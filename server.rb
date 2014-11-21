require 'sinatra'
require 'pry'
require 'sinatra/reloader'





def write_to_file

  File.open("some-file.txt", "a") do |f|
    f.write("blah\n")
  end
end


def read_from_file(file)
  grocery_list = File.read(file)
  grocery_list
  binding.pry
end


get '/groceries' do
  @grocery_list = read_from_file("grocery_list.txt")
  erb :index
end
