require 'test_helper'

class TournamentTeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tournament_team = tournament_teams(:one)
  end

  test "should get index" do
    get tournament_teams_url
    assert_response :success
  end

  test "should get new" do
    get new_tournament_team_url
    assert_response :success
  end

  test "should create tournament_team" do
    assert_difference('TournamentTeam.count') do
      post tournament_teams_url, params: { tournament_team: { team_id: @tournament_team.team_id, tournament_id: @tournament_team.tournament_id } }
    end

    assert_redirected_to tournament_team_url(TournamentTeam.last)
  end

  test "should show tournament_team" do
    get tournament_team_url(@tournament_team)
    assert_response :success
  end

  test "should get edit" do
    get edit_tournament_team_url(@tournament_team)
    assert_response :success
  end

  test "should update tournament_team" do
    patch tournament_team_url(@tournament_team), params: { tournament_team: { team_id: @tournament_team.team_id, tournament_id: @tournament_team.tournament_id } }
    assert_redirected_to tournament_team_url(@tournament_team)
  end

  test "should destroy tournament_team" do
    assert_difference('TournamentTeam.count', -1) do
      delete tournament_team_url(@tournament_team)
    end

    assert_redirected_to tournament_teams_url
  end
end
