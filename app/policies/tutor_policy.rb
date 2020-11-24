class TutorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    return true
  end
  
  def update?
    tutor.user == logged_in_user
  end
end
