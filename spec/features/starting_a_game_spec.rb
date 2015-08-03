require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end

  scenario 'request for you to fill in your name' do
    # visit '/'
    # click_link 'New Game'
    # fill_in('name', with: 'Adrian')
    # click_button 'Submit'
    # expect(page).to have_content "Welcome to Battleships Adrian"
  end
end