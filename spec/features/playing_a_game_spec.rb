require 'spec_helper'

feature 'Playing a game' do
  scenario 'Entering a coordinate' do
    visit '/game'
    fill_in('coordinate', with: 'A2')
    select 'Destroyer', :from => 'ship'
    choose('Horizontal')
    click_button 'Submit'
    expect($GAME.own_board_view($GAME.player_1)).to have_content('DD')
  end
end