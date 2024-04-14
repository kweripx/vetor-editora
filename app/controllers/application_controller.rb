class ApplicationController < ActionController::Base
  helper_method :current_psychologist

  private

  def current_psychologist
    @current_psychologist ||= Psychologist.find(session[:psychologist_id]) if session[:psychologist_id]
  end
end
