class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :edit, :update, :destroy]

    def index
        @active_junior_teams = Team.juniors.active.alphabetical.paginate(page: params[:page]).per_page(10) 
        @active_senior_teams = Team.seniors.active.alphabetical.paginate(page: params[:page]).per_page(10) 
        @inactive_teams = Team.inactive.alphabetical
    end

    def show  
        @current_student_assignments = @team.student_teams.current.by_position 
    end

    def new 
        @team = Team.new
    end

    def edit
    end

    def create
        @team = Team.new(team_params)
        if @team.save
            flash[:notice] = "Successfully created #{@team.name} team."
            redirect_to team_path(@team)
        else
            render action: 'new'
        end
    end

    def update
        if @team.update(team_params)
            flash[:notice] = "Updated all information for #{@team.name}" 
            redirect_to team_path(@team)
        else
            render action: 'edit'
        end
    end

    def destroy
        @team.destroy
        flash[:notice] = "Removed #{@team.name} from the system."
        redirect_to teams_path
    end

    private
    def team_params
        params.require(:team).permit(:name, :organization_id, :division, :active)
    end
    def set_team
        @team = Team.find(params[:id])
    end
end
