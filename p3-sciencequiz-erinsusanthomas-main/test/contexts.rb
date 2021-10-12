# require needed files
require './test/sets/students'
require './test/sets/organizations'
require './test/sets/teams'
require './test/sets/student_teams'
# require './test/sets/abilities'


module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Students
  include Contexts::Organizations
  include Contexts::Teams
  include Contexts::StudentTeams

  
  def create_all
    # Kernel.puts "Building context..."
    create_organizations
    # Kernel.puts "Created organizations"
    create_teams
    # Kernel.puts "Created teams"
    create_students
    # Kernel.puts "Created students"
    create_student_teams
    # Kernel.puts "Registered students on teams"
  end
  
end