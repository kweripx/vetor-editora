require 'rails_helper'

RSpec.describe "Psychologists", type: :request do
  describe "POST #create_evaluated" do
    let(:psychologist) { create(:psychologist) }
    let(:evaluated) { create(:evaluated, psychologist: psychologist) }
    let(:instrument) { create(:instrument, psychologist: psychologist) }
    let(:evaluated_params) { attributes_for(:evaluated) }

    before do
      allow_any_instance_of(ApplicationController).to receive(:current_psychologist).and_return(psychologist)
    end

    it "creates a new instrument application" do
      expect {
        post psychologist_evaluated_apply_instrument_path(psychologist_id: psychologist.id, evaluated_id: evaluated.id), params: { instrument_id: instrument.id }
      }.to change(InstrumentApplication, :count).by(1)
    end

    it "sends an email to the evaluated" do
      expect {
        post psychologist_evaluated_apply_instrument_path(psychologist_id: psychologist.id, evaluated_id: evaluated.id), params: { instrument_id: instrument.id }
      }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it "redirects to the evaluated page" do
      post psychologist_create_evaluated_path(psychologist_id: psychologist.id), params: { evaluated: evaluated_params }
      expect(response).to redirect_to(psychologist_evaluated_path(psychologist, Evaluated.last))
    end
  end
end
