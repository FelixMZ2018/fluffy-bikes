class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def show
      return true
    end
    def resolve
      scope.all
    end
  end
end
