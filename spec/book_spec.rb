require('spec_helper')

describe(Book) do
  describe("#initialize") do
    it("is initialized with title and author") do
      book1 = Book.new({:title => "It", :author => "Stephen King", :id => nil})
      expect(book1.title()).to(eq("It"))
    end
  end

  describe(".all") do
    it("starts off with no books") do
      expect(Book.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a book by its ID number") do
      book1 = Book.new({:title => "It", :author => "Stephen King", :id => nil})
      book1.save()
      book2 = Book.new({:title => "Misery", :author => "Stephen King", :id => nil})
      book2.save()
      expect(Book.find(book2.id())).to(eq(book2))
    end
  end

  describe("#==") do
    it("is the same book if it has the id, title and author") do
      book1 = Book.new({:title => "It", :author => "Stephen King", :id => nil})
      book2 = Book.new({:title => "It", :author => "Stephen King", :id => nil})
      expect(book1).to(eq(book2))
     end
   end

  describe("#update") do
    it("lets you update books in the database") do
      book1 = Book.new({:title => "It", :author => "Stephen King", :id => nil})
      book1.save()
      book1.update({:title => "Dreamcatcher", :author => "Stephen King"})
      expect(book1.title()).to(eq("Dreamcatcher"))
    end
  end

  describe("#delete") do
    it("lets you delete an actor from the database") do
      book1 = Book.new({:title => "It", :author => "Stephen King", :id => nil})
      book1.save()
      book2 = Book.new({:title => "It", :author => "Stephen King", :id => nil})
      book2.save()
      book2.delete()
      expect(Book.all()).to(eq([book1]))
    end
  end
end
