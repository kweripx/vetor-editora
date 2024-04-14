class ApplicationController < ActionController::Base
  before_action :authenticate_psychologist

  private

  def authenticate_psychologist
    if session[:psychologist_id].present?
      @current_psychologist = Psychologist.find_by(id: session[:psychologist_id])
    else
      return 'Por favor, faça login para continuar.'
    end
  end

  def current_psychologist
    @current_psychologist
  end
end
