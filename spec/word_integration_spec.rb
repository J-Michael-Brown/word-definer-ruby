require('capybara/rspec')
require('./app')
require('pry')
require('word')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('Home Page/Dictionary page', {:type => :feature}) do
  it('Has a list of All Current Words, and a link to their definitions.') do
    visit('/create_new_word')
    fill_in('new-term', :with => "Test")
    fill_in('first-definition', :with => "A test to see if this passes")
    click_button('Add to Library')
    click_link('Home')
    expect(page).to have_content("Test")
  end
end

describe('add definition funcitonallity', {:type => :feature}) do
  it "when you view a word, you should be able to add a new definition to that word." do
    visit('/create_new_words')
    fill_in('new-term', :with => "inspiring")
    fill_in('first-definition', :with => "the possibility of failure")
    click_button('Add to Library')
    visit('/definitions/inspiring')
    fill_in('new-definition', :with => "A great success!")
    click_button('Add!')
    expect(page).to have_content("A great success!")
  end
end
