require 'rails_helper'

RSpec.describe "Evaluateds", type: :request do
  let(:instrument_application) { create(:instrument_application) }

  describe "GET #fill_data" do
    it "assigns the requested instrument application to @instrument_application" do
      get evaluated_fill_data_path(evaluated_id: instrument_application.id), params: { token: instrument_application.token }, headers: { Accept: 'text/html' }
      expect(response).to have_http_status(:ok)
    end

    it "renders the fill_data template" do
      get evaluated_fill_data_path(evaluated_id: instrument_application.id), params: { token: instrument_application.token }, headers: { Accept: 'text/html' }
      expect(response).to render_template(:fill_data)
    end
  end

  describe "POST #start_instrument" do
    let(:evaluated_params) { attributes_for(:evaluated) }

    it "updates the instrument application with the evaluated params" do
      post evaluated_start_instrument_path(evaluated_id: instrument_application.id), params: { token: instrument_application.token, evaluated: evaluated_params }
      instrument_application.reload
      evaluated = instrument_application.evaluated
      expect(evaluated.name).to eq(evaluated_params[:name])
      expect(evaluated.email).to eq(evaluated_params[:email])
      expect(evaluated.cpf).to eq(evaluated_params[:cpf])
      expect(evaluated.birth_date).to eq(Date.parse(evaluated_params[:birth_date]))
    end

    it "redirects to the instrument page" do
      post evaluated_start_instrument_path(evaluated_id: instrument_application.id), params: { token: instrument_application.token, evaluated: evaluated_params }
      expect(response).to redirect_to(instrument_path(instrument_application.instrument))
    end
  end
end
