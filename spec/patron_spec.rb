require('spec_helper')

describe(Patron) do
  describe('#name') do
    it("is initialized with a name") do
      member1 = Patron.new({:name => "Brad Pitt", :id => nil})
      expect(member1.name()).to(eq("Brad Pitt"))
    end
  end

  describe(".all") do
    it("starts off with no patrons") do
      expect(Patron.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a patron by its ID number") do
      member1 = Patron.new({:name => "Brad Pitt", :id => nil})
      member1.save()
      expect(Patron.find(member1.id())).to(eq(member1))
    end
  end

  describe("#==") do
    it("is the same patron if it has the same name and id") do
      member1 = Patron.new({:name => "Brad Pitt", :id => nil})
      member2 = Patron.new({:name => "Brad Pitt", :id => nil})
      expect(member1).to(eq(member2))
    end
  end

  describe("#update") do
    it("lets you update patrons in the database") do
      member1 = Patron.new({:name => "Brad Pitt", :id => nil})
      member1.save()
      member1.update({:name => "Brian Fan"})
      expect(member1.name()).to(eq("Brian Fan"))
    end
    #
    it("lets you add an book to a patron") do
      member1 = Patron.new({:name => "Brad Pitt", :id => nil})
      member1.save()
      bible = Book.new({:title => "Bible", :author => "God", :id => nil})
      bible.save()
      member1.update({:book_ids => [bible.id()]})
      expect(member1.books()).to(eq([bible]))
    end
  end

  describe("#books") do
    it("will show all the books patron has added") do
      member1 = Patron.new({:name => "Brad Pitt", :id => nil})
      member1.save()
      bible = Book.new({:title => "Bible", :author => "God", :id => nil})
      bible.save()
      member1.update({:book_ids => [bible.id()]})
      expect(member1.books()).to(eq([bible]))
    end
  end


  describe("#delete") do
    it("lets you delete an patron from the database") do
      member1 = Patron.new({:name => "Brad Pitt", :id => nil})
      member1.save()
      member2 = Patron.new({:name => "Brian Fan", :id => nil})
      member2.save()
      member1.delete()
      expect(Patron.all()).to(eq([member2]))
    end
  end
end
