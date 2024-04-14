require 'rails_helper'

RSpec.describe "Psychologists", type: :request do
  describe "POST #create_evaluated" do
    let(:psychologist) { create(:psychologist) }
    let(:evaluated_params) { attributes_for(:evaluated) }

    before do
      # For Devise, this would typically be:
      # sign_in psychologist
      # If not using Devise, you might need to manually set the session:
      # session[:psychologist_id] = psychologist.id
      allow_any_instance_of(ApplicationController).to receive(:current_psychologist).and_return(psychologist)
    end

    it "creates a new evaluated" do
      expect {
        post psychologist_create_evaluated_path(psychologist_id: psychologist.id), params: { evaluated: evaluated_params }
      }.to change(Evaluated, :count).by(1)
    end

    it "redirects to the evaluated page" do
      post psychologist_create_evaluated_path(psychologist_id: psychologist.id), params: { evaluated: evaluated_params }
      expect(response).to redirect_to(psychologist_evaluated_path(psychologist, Evaluated.last))
    end
  end
end
