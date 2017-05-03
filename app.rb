require('sinatra')
require('sinatra/reloader')
require('./lib/book')
require('./lib/patron')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "library_test"})

get('/') do
  erb(:index)
end

get('/books/new') do
  erb(:books_form)
end

get('/books') do
  @books = Book.all()
  erb(:books)
end

get('/books/:id/edit') do
erb(:books_edit_form)
end

post('/books') do
  title = params.fetch('title')
  author = params.fetch('author')
  @book = Book.new({:title => title, :author => author, :id => nil })
  @book.save()
  erb(:success)
end

get('/books/:id') do
  @book = Book.find(params.fetch("id").to_i())
  erb(:book)
end
