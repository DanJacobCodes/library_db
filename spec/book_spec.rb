require('spec_helper')

describe(Book) do
  describe('.all') do
    it('starts off with no lists') do
      expect(Book.all()).to(eq([]))
    end
  end

#   describe('#name') do
#     it("tells you its name") do
#       test_list = Book.new({:name => "Brian", :id => nil})
#       expect(test_list.name()).to(eq("Brian"))
#     end
#   end
#
#   describe('#id') do
#     it('tells you its id') do
#       test_list = Book.new(:name => "Brian", :id=> nil )
#       test_list.save()
#       expect(test_list.id()).to(be_an_instance_of(Fixnum))
#     end
#   end
#
#   describe('#save') do
#     it('lets you save lists to the database') do
#       test_list = Book.new({:name => "Brian", :id => nil })
#       test_list.save()
#       expect(Book.all()).to(eq([test_list]))
#     end
#   end
#
#   describe('#==') do
#     it("is the same list if it has the same name") do
#     list1 = Book.new({:name => "Brian", :id => nil})
#     list2 = Book.new({:name => "Brian", :id => nil})
#     expect(list1).to(eq(list2))
#     end
#   end
#
#   describe(".find") do
#     it("returns a list by its ID") do
#       test_list = Book.new({:name => "Epicodus stuff", :id => nil})
#       test_list.save()
#       test_list2 = Book.new({:name => "Home stuff", :id => nil})
#       test_list2.save()
#       expect(Book.find(test_list2.id())).to(eq(test_list2))
#     end
#   end
#
#   describe("#tasks") do
#     it("returns an array of tasks for that list") do
#       test_list = Book.new({:name => "Epicodus stuff", :id => nil})
#       test_list.save()
#       test_task = Task.new({:description => "Learn SQL", :list_id => test_list.id()})
#       test_task.save()
#       test_task2 = Task.new({:description => "Review Ruby", :list_id => test_list.id()})
#       test_task2.save()
#       expect(test_list.tasks()).to(eq([test_task, test_task2]))
#     end
#   end
#
#   describe("#update") do
#     it("lets you update the lists in the database") do
#       list = Book.new({:name=> "Epicodus stuff", :id => nil})
#       list.save()
#       list.update({:name =>"Homework stuff"})
#       expect(list.name()).to(eq("Homework stuff"))
#     end
#   end
#
#   describe("#delete") do
#   it("deletes a list's tasks from the database") do
#     list = Book.new({:name => "Epicodus stuff", :id => nil})
#     list.save()
#     task = Task.new({:description => "learn SQL", :list_id => list.id()})
#     task.save()
#     task2 = Task.new({:description => "Review Ruby", :list_id => list.id()})
#     task2.save()
#     list.delete()
#     expect(Task.all()).to(eq([]))
#   end
# end
end
