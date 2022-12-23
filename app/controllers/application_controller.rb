class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :authenticate

  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

  private

  def authenticate
    return render json: { error: "Not Authorized" }, status: :unauthorized unless session.include? :user_id
  end

  def unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity 
  end

end
