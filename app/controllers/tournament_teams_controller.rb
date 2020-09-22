class TournamentTeamsController < ApplicationController
  before_action :set_tournament_team, only: [:show, :edit, :update, :destroy]

  # GET /tournament_teams
  # GET /tournament_teams.json
  def index
    @tournament_teams = TournamentTeam.all
  end

  # GET /tournament_teams/1
  # GET /tournament_teams/1.json
  def show
  end

  # GET /tournament_teams/new
  def new
    @tournament_team = TournamentTeam.new
  end

  # GET /tournament_teams/1/edit
  def edit
  end

  # POST /tournament_teams
  # POST /tournament_teams.json
  def create
    @tournament_team = TournamentTeam.new(tournament_team_params)

    respond_to do |format|
      if @tournament_team.save
        format.html { redirect_to @tournament_team, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @tournament_team }
      else
        format.html { render :new }
        format.json { render json: @tournament_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournament_teams/1
  # PATCH/PUT /tournament_teams/1.json
  def update
    if tournament_team_params["is_approved"] == nil || current_user.is_admin
      respond_to do |format|
        if @tournament_team.update(tournament_team_params)
          format.html { redirect_to @tournament_team, notice: 'Request was successfully updated.' }
          format.json { render :show, status: :ok, location: @tournament_team }
        else
          format.html { render :edit }
          format.json { render json: @tournament_team.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /tournament_teams/1
  # DELETE /tournament_teams/1.json
  def destroy
    @tournament_team.destroy
    respond_to do |format|
      format.html { redirect_to tournament_teams_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament_team
      @tournament_team = TournamentTeam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tournament_team_params
      params.require(:tournament_team).permit(:team_id, :tournament_id, :is_approved)
    end
end
