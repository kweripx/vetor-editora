require 'rails_helper'

RSpec.describe "Instruments", type: :request do
  describe "POST #submit_answers" do
    let(:instrument_application) { create(:instrument_application) }
    let(:answers) { ['1', '2', '3', '1', '2'] }

    it "updates the instrument application with the calculated score and responds with ok" do
      post instrument_submit_answers_path(instrument_application.id), params: { instrument_application_id: instrument_application.id, answers: answers }
      instrument_application.reload
      expect(instrument_application.score).to eq(11)
      expect(response).to have_http_status(:ok)
    end

    it "expect response" do
      post instrument_submit_answers_path(instrument_application.id), params: { instrument_application_id: instrument_application.id, answers: answers }
      expect(response)
    end
  end
end
