class StudentTeam < ApplicationRecord
  include AppHelpers::Activeable::InstanceMethods
  extend AppHelpers::Activeable::ClassMethods
  include AppHelpers::Validations

  # Relationships
  belongs_to :student
  belongs_to :team

  # Scopes
  scope :by_position,   -> { order(:position) }
  scope :alphabetical,  -> { joins(:student).order('last_name, first_name') }
  scope :chronological, -> { order(:start_date) }
  scope :for_team,      ->(team) { where('team_id =?', team.id) }
  scope :for_student,   ->(student) { where(student: student) }
  scope :captains,      -> { where(position: 1) }
  scope :current,       -> { where('end_date IS NULL') }
  scope :past,          -> { where('end_date IS NOT NULL') }

  # Validations
  validates_presence_of :start_date, :position, :student_id, :team_id
  validates_numericality_of :position, greater_than: 0, less_than: 6, only_integer: true
  validates_date :start_date, on_or_before: ->{ Date.current }, on_or_before_message: "cannot be in the future"
  validates_date :end_date, on_or_after: :start_date, on_or_before: ->{ Date.current }, allow_blank: true
  validate -> { is_active_in_system(:student) }, on: :create
  validate -> { is_active_in_system(:team) }, on: :create
  # NOTE: validation for student grade given team division will be in phase 4; not needed here

  # Other methods
  def terminate_now
    current_assignment = self.student.student_teams.current.first
    if current_assignment.nil?
      return true 
    else
      current_assignment.end_date = Date.current
      current_assignment.update_attribute(:end_date, Date.current)
    end
  end

  # Callbacks
  before_create :end_previous_team_assignment

  private
  def end_previous_team_assignment
    current_assignment = self.student.student_teams.current.first
    if current_assignment.nil?
      return true 
    else
      current_assignment.update_attribute(:end_date, self.start_date.to_date)
    end
  end

end
