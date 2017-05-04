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
@book = Book.find(params.fetch("id").to_i())
erb(:books_edit_form)
end

patch('/books/:id')do
  title = params.fetch('title')
  author = params.fetch('author')
  @book = Book.find(params.fetch('id').to_i())
  @book.update({:title=>title, :author=>author})
  @books = Book.all()
  erb(:books)
end

delete('/books/:id') do
  @book = Book.find(params.fetch('id').to_i())
  @book.delete()
  @books = Book.all()
  erb(:books)
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

## Beginning of Patrons routing##
get('/patrons/new') do
  erb(:patron_form)
end

get('/patrons') do
  @patrons = Patron.all()
  erb(:patrons)
end

post('/patrons') do
  name = params.fetch('name')
  @patron = Patron.new({:name => name, :id => nil})
  @patron.save()
  erb(:success)
end

get('/patrons/:id') do
  @patron = Patron.find(params.fetch("id").to_i())
  erb(:patron)
end

get('/patrons/:id/edit')do
@patron = Patron.find(params.fetch("id").to_i())
erb(:patron_edit_form)
end

patch('/patrons/:id') do
  name = params.fetch('name')
  @patron = Patron.find(params.fetch("id").to_i())
  @patron.update({:name => name})
  @patrons = Patron.all()
  erb(:patrons)
end

delete('/patrons/:id') do
  @patron = Patron.find(params.fetch("id").to_i())
  @patron.delete()
  @patrons = Patron.all()
  erb(:patrons)
end
