class OrganisationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view an organisation
  end

  def create?
    true  # Anyone can create an organisation
  end

  def update?
    record.user == user  # Only organisation creator can update it
  end

  def destroy?
    record.user == user  # Only organisation creator can update it
  end
end
