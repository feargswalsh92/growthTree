class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    render json: { }, status: 200
  end

  protected

  # Basic JSON response for successful requests that
  # don't need to return anything (e.g. DELETE)
  def render_json_success
    render json: { }, status: 200
  end

  def bad_request(object)
    errors = { message: object.errors.full_messages, code: "badrequest" }
  end

  def render_json(data, errors, status)
    data = data ||= nil # success content
    errors = errors ||= nil # { message: message, code: code }
    status = status ||= 500 # catch all status
    render json: { data: data, errors: errors }, status: status 
  end

  # Error Responses
  def render_json_bad_request(message)
    render json: { errors: { message: message, code: 'badrequest' } }, status: 400
  end

  def render_json_unauthorized(message)
    render json: { errors: { message: message, code: 'unauthorized' } }, status: 401
  end

  def render_json_request_failed(message)
    render json: { errors: { message: message, code: 'unauthorized' } }, status: 402
  end

  def render_json_not_found(message)
    render json: { errors: { message: message, code: 'notfound' } }, status: 404
  end

end
