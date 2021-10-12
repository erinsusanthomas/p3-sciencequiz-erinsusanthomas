class OrganizationsController < ApplicationController
    before_action :set_organization, only: [:show, :edit, :update, :destroy]

    def index
        @active_organizations = Organization.active.alphabetical.paginate(page: params[:page]).per_page(10) 
        @inactive_organizations = Organization.inactive.alphabetical
    end

    def show 
        @current_students = @organization.students.active.alphabetical
        @current_teams = @organization.teams.by_division.active.alphabetical
    end

    def new 
        @organization = Organization.new
    end

    def edit
    end

    def create
        @organization = Organization.new(organization_params)
        if @organization.save
            flash[:notice] = "Successfully created #{@organization.name}."
            redirect_to organization_path(@organization)
        else
            render action: 'new'
        end
    end

    def update
        if @organization.update(organization_params)
            flash[:notice] = "Updated all information for #{@organization.short_name}" 
            redirect_to organization_path(@organization)
        else
            render action: 'edit'
        end
    end

    def destroy
        @organization.destroy
        flash[:notice] = "Removed #{@organization.name} from the system."
        redirect_to organizations_path
    end

    private
    def organization_params
        params.require(:organization).permit(:name, :street_1, :street_2, :city, :state, :zip, :short_name, :active)
    end
    def set_organization
        @organization = Organization.find(params[:id])
    end
end
