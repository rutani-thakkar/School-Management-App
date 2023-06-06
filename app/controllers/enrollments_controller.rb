class EnrollmentsController < ApplicationController
  before_action :authorize_enrollment
  before_action :find_enrollment, except: [:index]

  def index
    batch_ids = current_user.school.batches.pluck(:id)
    @enrollments = Enrollment.where(status: 'Requested', batch_id: batch_ids)
  end

  def accept_request
    @enrollment.update(status: :Accepted)
    redirect_to enrollments_path, notice: 'Enrollment request accepted successfully!'
  end

  def denied_request
    @enrollment.update(status: :Denied)
    redirect_to enrollments_path, notice: 'Enrollment request denied successfully!'
  end

  private

  def find_enrollment
    @enrollment  = Enrollment.find(params[:id])
  end

  def authorize_enrollment
    authorize! :manage, Enrollment
  end
end
