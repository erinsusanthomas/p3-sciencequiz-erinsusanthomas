class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update, :destroy]

    def index
        @active_students = Student.active.alphabetical.paginate(page: params[:page]).per_page(10) 
        @inactive_students = Student.inactive.alphabetical
    end

    def show  
        @current_team = @student.current_team
    end

    def new 
        @student = Student.new
    end

    def edit
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            flash[:notice] = "Successfully created #{@student.proper_name}."
            redirect_to student_path(@student)
        else
            render action: 'new'
        end
    end

    def update
        if @student.update(student_params)
            flash[:notice] = "Updated all information on #{@student.proper_name}" 
            redirect_to student_path(@student)
        else
            render action: 'edit'
        end
    end

    def destroy
        @student.destroy
        flash[:notice] = "Removed #{@student.proper_name} from the system."
        redirect_to students_path
    end

    private
    def student_params
        params.require(:student).permit(:first_name, :last_name, :grade, :organization_id, :active)
    end
    def set_student
        @student = Student.find(params[:id])
    end
end
