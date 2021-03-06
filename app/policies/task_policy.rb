class TaskPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    admin? || (!admin? && user==record)
  end

  def new?
    create?
  end

  def create?
    admin?
  end

  def edit?
    update?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end

  def done?
    (!admin? && user==record)
  end


  # Scope for Users
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: @user.id)
      end
    end
  end
end
