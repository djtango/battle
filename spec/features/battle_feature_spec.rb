require 'capybara'
require 'selenium-webdriver'
# require './chrome_addon'
# include Capybara::DSL

# Capybara.default_driver = :selenium

feature 'first page' do
  scenario 'entering names' do
    visit '/'
    fill_in('player_1_name', with: 'deon')
    fill_in('player_2_name', with: 'pidgy')
    click_button('Submit')
    expect(page).to have_content 'deon'
    expect(page).to have_content 'pidgy'
  end
end
