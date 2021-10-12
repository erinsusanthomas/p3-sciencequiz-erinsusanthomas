class StudentTeamsController < ApplicationController
    before_action :set_student_team, only: [:terminate, :destroy]

    def new  
        @student_team = StudentTeam.new
        if params[:team_id] != nil
            @team = Team.find(params[:team_id])
            @current_students = @team.student_teams.current.map{|a| a.student}
        end
        if params[:student_id] != nil                  
            @student = Student.find(params[:student_id])
            @current_team = @student.student_teams.current.map{|a| a.team}
        end
    end

    def create
        @student_team = StudentTeam.new(student_team_params)
        @student_team.start_date = Date.current if @student_team.start_date.nil?
        if @student_team.save
            flash[:notice] = "Successfully added the student team assignment."
            redirect_to team_path(@student_team.team) 
        else
            render action: 'new', locals: { team: @team } 
        end
    end

    def terminate 
        @student_team.terminate_now
        redirect_to team_path(@student_team.team)
        flash[:notice] = "Team assignment terminated as of today."
        
    end

    def destroy
        @student_team.destroy
        flash[:notice] = "Successfully destroyed team assignment."
        redirect_to team_path(@student_team.team)
    end

    private
    def student_team_params
        params.require(:student_team).permit(:student_id, :team_id, :start_date, :end_date, :position, :active)
    end
    def set_student_team
        @student_team = StudentTeam.find(params[:id])
    end
end
