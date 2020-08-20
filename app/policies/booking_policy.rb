class BookingPolicy < ApplicationPolicy
  class Scope < Scope


    def index?
      return true
    end

    def new?
      return true
    end
    def create?
      return true
    end

    def update?
      record.user == user
    end

    def destroy?
      record.user == user
    end

    def show?
      return true
    end


    def resolve
      scope.all
    end
  end
end