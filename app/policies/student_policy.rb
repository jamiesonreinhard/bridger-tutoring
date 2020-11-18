class StudentPolicy < ApplicationPolicy
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
    student.user == user
  end
end
