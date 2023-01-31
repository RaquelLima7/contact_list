class ContactPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end

    # def create?
    #   true
    # end

    # def new?
    #   create?
    # end

    def index?
      owner?
    end

    def show?
      owner?
    end

    def edit?
      owner?
    end

    def update?
      owner?
    end

    def destroy?
      owner?
    end

    def owner?
      record.user_id == user.id
    end
  end
end
