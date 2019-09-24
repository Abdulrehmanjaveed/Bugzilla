class ProjectPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.try(:manager?)
        scope.where(managerid: user.id)
      elsif user.try(:qa?)
        scope.all
      end
    end
  end

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @user.manager?
  end

  def new?
    @user.manager?
  end

  def update?
    @user.manager?
  end

  def edit?
    @user.manager?
  end

  def destroy?
    @user.manager?
  end
end
