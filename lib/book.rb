class Book
  attr_accessor(:title, :author, :id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
    @id = attributes.fetch(:id)
  end

  def self.all
    books_in_database = DB.exec("SELECT * FROM books;")
    all_books = []
    books_in_database.each() do |book|
      title = book.fetch('title')
      author = book.fetch('author')
      id = book.fetch('id').to_i()
      each_book = Book.new({:title => title, :author => author, :id => id})
      all_books.push(each_book)
    end
    all_books
  end

  def fullname
    'Title: ' + @title + ' Author: ' + @author
  end

  def save
    result = DB.exec("INSERT INTO books (title, author) VALUES ('#{@title}', '#{@author}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end



  def ==(another_book)
    (self.title() == another_book.title()) && (self.id() == another_book.id()) && (self.author() == another_book.author())
  end


  def self.find(id)
    found_book = nil
    Book.all().each() do |book|
      if book.id() == id
        found_book = book
      end
    end
    found_book
  end

  def update(attributes)
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
    @id = self.id()
    DB.exec("UPDATE books SET title = '#{@title}', author = '#{@author}' WHERE id = #{@id};")
  end

  def delete
   DB.exec("DELETE FROM books WHERE id = #{self.id()};")
 end

  def self.search(keyword)
    search_books = DB.exec("SELECT * FROM books WHERE title = '#{keyword}' OR author = '#{keyword}'")
    found_books = []
    search_books.each() do |book|
      title = book.fetch('title')
      author = book.fetch('author')
      id = book.fetch('id').to_i()
      each_book = Book.new({:id => id, :title => title, :author => author})
      found_books.push(each_book)
    end
    found_books
  end

end
