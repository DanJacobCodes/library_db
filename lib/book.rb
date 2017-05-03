class Book
  attr_accessor(:title, :author,:id)

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
      each_book = Book.new({:title => title, :author => author, :id => nil})
      all_books.push(each_book)
    end
    all_books
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
    DB.exec("UPDATE books SET title = '#{@title}', author = #{@author} WHERE id = #{@id};")
  end

  define_method(:delete) do
   DB.exec("DELETE FROM books WHERE id = #{self.id};")
 end


end
