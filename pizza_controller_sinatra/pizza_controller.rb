require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( 'models/pizza.rb' )

# INDEX - READ - see all pizza orders

get '/pizzas' do  #always plural
  @pizzas = Pizza.all()
  erb(:index)
end



#  NEW - CREATE - New pizza order - Form

get '/pizzas/new' do
  erb(:new)
end


# SHOW - READ - Find one pizza by id

get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end


#CREATE - CREATE POST request

post '/pizzas' do
  @pizza = Pizza.new(params)
  @pizza.save()
  erb(:create)
end


#EDIT - change order details
get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end


#UPDATE - send changes to db

post '/pizzas/:id' do
  @pizza = Pizza.new(params)
  @pizza.update()
  erb(:update)
end


# DELETE - Delete order by id

post '/pizzas/:id/delete' do
  @pizza = Pizza.find(params[:id])
  @pizza.delete()
  erb(:delete)
end


