class ProjectUserPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.where(user_id: user.id) if user.try(:developer?)
    end
  end

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    false
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
