require 'capybara'
require 'selenium-webdriver'
# require './chrome_addon'
include Capybara::DSL

Capybara.default_driver = :selenium

visit 'http://localhost:4567/'

feature 'first page' do
  scenario 'entering names' do
    # expect(page).to have_content('Hello')
    expect(page).to have_css('#form')
    fill_in('player_1', with: 'deon')
    fill_in('player_2', with: 'pidgy')
    click_button('Submit')
  end
end
