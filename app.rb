require('sinatra')
require('sinatra/reloader')
require('./lib/book')
require('./lib/patron')
require('pry')
require('pg')
require('date')
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

get('/search_books') do
  keyword = params.fetch('keyword')
  @found_books = Book.search(keyword)
  erb(:search_result)

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
  @books = Book.all()
  erb(:patron)
end

get('/patrons/:id/edit')do
@patron = Patron.find(params.fetch("id").to_i())
erb(:patron_edit_form)
end


#add books to patron
patch('/patrons/:id') do

  patron_id = params.fetch('id').to_i()
  @patron = Patron.find(patron_id)
  name = params.fetch('name', @patron.name)
  book_ids = params.fetch('book_ids', [])
  @patron.update({:book_ids => book_ids, :name => name})
  @books = Book.all()
  erb(:patron)
end



delete('/patrons/:id') do
  @patron = Patron.find(params.fetch("id").to_i())
  @patron.delete()
  @patrons = Patron.all()
  erb(:patrons)
end
