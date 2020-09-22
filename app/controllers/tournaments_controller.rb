class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]
  before_action :unauthorized_user, except: [:index, :show]

  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = Tournament.all
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
    @tournament_teams = TournamentTeam.where(tournament_id: @tournament.id)
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
    # if current_user.is_admin != true
    #   redirect_to tournaments_path, notice: 'You are not authorized for this action.'
    # end
  end

  # GET /tournaments/1/edit
  def edit
    # if current_user.is_admin != true
    #   redirect_to tournaments_path, notice: 'You are not authorized for this action.'
    # end
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.user_id = current_user.id
    respond_to do |format|
      if @tournament.save
        format.html { redirect_to @tournament, notice: 'Tournament was successfully created.' }
        format.json { render :show, status: :created, location: @tournament }
      else
        format.html { render :new }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament }
      else
        format.html { render :edit }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: 'Tournament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def unauthorized_user
      if current_user.is_admin != true
        redirect_to tournaments_path, notice: 'You are not authorized for this action.'
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tournament_params
      params.require(:tournament).permit(:name)
    end


end
