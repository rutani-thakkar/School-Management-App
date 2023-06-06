module ApplicationHelper
  def is_user_enrolled?(user, batch)
    user.enrollments.pluck(:batch_id).include?(batch.id)
  end

  def user_enrollment_status(user, batch)
    status = user.enrollments.find_by(batch_id: batch.id).status
    status == 'Accepted' ?  'Enrolled' : status
  end
end
