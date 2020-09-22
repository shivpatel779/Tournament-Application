require "application_system_test_case"

class TournamentTeamsTest < ApplicationSystemTestCase
  setup do
    @tournament_team = tournament_teams(:one)
  end

  test "visiting the index" do
    visit tournament_teams_url
    assert_selector "h1", text: "Tournament Teams"
  end

  test "creating a Tournament team" do
    visit tournament_teams_url
    click_on "New Tournament Team"

    fill_in "Team", with: @tournament_team.team_id
    fill_in "Tournament", with: @tournament_team.tournament_id
    click_on "Create Tournament team"

    assert_text "Tournament team was successfully created"
    click_on "Back"
  end

  test "updating a Tournament team" do
    visit tournament_teams_url
    click_on "Edit", match: :first

    fill_in "Team", with: @tournament_team.team_id
    fill_in "Tournament", with: @tournament_team.tournament_id
    click_on "Update Tournament team"

    assert_text "Tournament team was successfully updated"
    click_on "Back"
  end

  test "destroying a Tournament team" do
    visit tournament_teams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tournament team was successfully destroyed"
  end
end
