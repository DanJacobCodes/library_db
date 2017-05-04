require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new book', {:type => :feature}) do
  it('allows a user to add a book to database') do
    visit('/')
    click_link('Add Book')
    fill_in('title', :with =>'It')
    fill_in('author', :with =>'Stephen King')
    click_button('Add Book')
    expect(page).to have_content('SUCCESS!')
  end
end

describe('viewing all of the books', {:type => :feature}) do
  it('allows a user to see all of the books that have been created') do
    book1 = Book.new({:title => "It", :author => "Stephen King", :id => nil})
    book1.save()
    visit('/')
    click_link('View All Books')
    expect(page).to have_content(book1.title())
  end
end
