Rails.application.routes.draw do

  #Semi-static pages
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy
  # Set the root url
  root to: 'home#index'

  #Routes for OrganizationsController
  get 'organizations', to: 'organizations#index', as: :organizations
  post 'organizations', to: 'organizations#create'
  get 'organizations/new', to: 'organizations#new', as: :new_organization
  get 'organizations/:id/edit', to: 'organizations#edit', as: :edit_organization
  get 'organizations/:id', to: 'organizations#show', as: :organization
  patch 'organizations/:id', to: 'organizations#update'
  delete 'organizations/:id', to: 'organizations#destroy'

    #Routes for StudentsController
    get 'students', to: 'students#index', as: :students
    post 'students', to: 'students#create'
    get 'students/new', to: 'students#new', as: :new_student
    get 'students/:id/edit', to: 'students#edit', as: :edit_student
    get 'students/:id', to: 'students#show', as: :student
    patch 'students/:id', to: 'students#update'
    delete 'students/:id', to: 'students#destroy'

    #Routes for TeamsController
    get 'teams', to: 'teams#index', as: :teams
    post 'teams', to: 'teams#create'
    get 'teams/new', to: 'teams#new', as: :new_team
    get 'teams/:id/edit', to: 'teams#edit', as: :edit_team
    get 'teams/:id', to: 'teams#show', as: :team
    patch 'teams/:id', to: 'teams#update'
    delete 'teams/:id', to: 'teams#destroy'

    #Routes for StudentTeamsControllerController
    get 'student_teams/new', to: 'student_teams#new', as: :new_student_team
    post 'student_teams', to: 'student_teams#create', as: :student_teams
    patch 'student_teams/:id', to: 'student_teams#terminate', as: :terminate_student_team
    delete 'student_teams/:id', to: 'student_teams#destroy', as: :remove_student_team

end
