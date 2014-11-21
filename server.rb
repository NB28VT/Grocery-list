require 'sinatra'
require 'pry'
require 'sinatra/reloader'





def write_to_file(item)
  File.open("grocery_list.txt", "a") do |f|
    f.write("#{item}\n")
  end
end


def read_from_file(file)
  grocery_list = File.read(file)
  grocery_list
end


get '/groceries' do
  @grocery_list = read_from_file("grocery_list.txt")
  erb :index
end

post '/groceries' do
  @item = params[:item]
  write_to_file(@item)
  redirect '/groceries'
end
