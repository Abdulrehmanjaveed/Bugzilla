class BugPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end
  end

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @user.qa?
  end

  def new?
    @user.qa?
  end

  def update?
    @user.qa?
  end

  def edit?
    @user.qa?
  end

  def assign_bug?
    @user.developer?
  end

  def destroy?
    @user.qa?
  end
end
