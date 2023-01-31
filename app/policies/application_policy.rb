# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    owner?
  end

  def show?
    owner?
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    owner?
  end

  def edit?
    owner?
  end

  def destroy?
    owner?
  end

  def owner?
    record.user_id.eql?(user.id)
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
