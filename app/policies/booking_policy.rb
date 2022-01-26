class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
    # unless user(current_user) == dress.user_id(owner_id) | So that the owner cannot book their own dress
  end

  def show?
    dress = Dress.find(record.dress_id)
    owner = dress.user_id
    record.user == user || owner == user
  end

  def update?
    dress = Dress.find(record.dress_id)
    owner = dress.user_id
    record.user == user || owner == user
    # This logic lets only the owner of the dress and person who made the booking auhtorized?
  end

  def destroy?
    record.user == user
    # only admin can destroy and have the status of the booking go to completed or cancelled? Similar to Amazon,order history cant be deleted
  end

end
