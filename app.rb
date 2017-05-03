require('sinatra')
require('sinatra/reloader')
require('./lib/book')
require('./lib/patron')
require('pry')
require('pg')
also_reload('lib/**/*.rb')


get('/') do
  erb(:index)
end

get('/books/new') do
  erb(:books_form)
end

get('/books') do
  erb(:books)
end

post('/books') do
 erb(:success)
end
