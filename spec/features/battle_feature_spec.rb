require 'capybara'
require 'selenium-webdriver'
# require './chrome_addon'
# include Capybara::DSL
# Capybara.default_driver = :selenium

feature 'first page' do
  scenario 'entering names' do
    sign_in_and_play
    expect(page).to have_content 'deon'
    expect(page).to have_content 'fergus'
  end

  scenario 'start page after name entry' do
    sign_in_and_play
    expect(page).to have_content "fergus: 100"
  end
end

feature 'attack player 2' do
  scenario 'player 1 hits attack button' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content('deon hit fergus! Damage was 10HP')
  end
end
