require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza.rb' )

#INDEX - list of all pizza orders
get '/pizzas' do
  @pizzas = Pizza.all()
  erb( :index )
end

#NEW - return an html form to fill in
get '/pizzas/new' do
  erb ( :new )
end

#CREATE - create an order
post '/pizzas' do
  pizza = Pizza.new( params )
  pizza.save()
  erb( :create )
end

#SHOW - one particular order
get '/pizzas/:id' do
  @pizza = Pizza.find( params[:id] )
  erb( :show )
end

#EDIT - 
get '/pizzas/:id/edit' do
  @pizza = Pizza.find( params[:id] )
  erb( :edit )
end

#UPDATE
post '/pizzas/:id' do
  # binding.pry
  pizza = Pizza.new( params )
  pizza.update()
  erb( :update )
end

#DESTROY - delete an order
post '/pizzas/:id/delete' do
  pizza = Pizza.find( params[:id] )
  pizza.delete()
  erb( :destroy )
end