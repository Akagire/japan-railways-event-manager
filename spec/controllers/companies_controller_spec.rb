require 'rails_helper'

describe CompaniesController, type: :controller do
  let(:valid_attributes) {
    {
      name: 'hoge',
      base_url: 'https://example.com'
    }
  }

  let(:invalid_attributes) {
    {
      name: '',
      base_url: 'https://example.com'
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CompaniesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Company.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      company = Company.create! valid_attributes
      get :show, params: { id: company.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      company = Company.create! valid_attributes
      get :edit, params: { id: company.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Company' do
        expect {
          post :create, params: { company: valid_attributes }, session: valid_session
        }.to change(Company, :count).by(1)
      end

      it 'redirects to the created company' do
        post :create, params: { company: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Company.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { company: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          name: 'JR西日本',
          base_url: 'https://www.example.com/jr-west'
        }
      }

      it 'updates the requested company' do
        company = Company.create! valid_attributes
        put :update, params: { id: company.to_param, company: new_attributes }, session: valid_session
        company.reload
        expect(company.name).to eq new_attributes[:name]
        expect(company.base_url).to eq new_attributes[:base_url]
      end

      it 'redirects to the company' do
        company = Company.create! valid_attributes
        put :update, params: { id: company.to_param, company: valid_attributes }, session: valid_session
        expect(response).to redirect_to(company)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        company = Company.create! valid_attributes
        put :update, params: { id: company.to_param, company: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested company' do
      company = Company.create! valid_attributes
      expect {
        delete :destroy, params: { id: company.to_param }, session: valid_session
      }.to change(Company, :count).by(-1)
    end

    it 'redirects to the companies list' do
      company = Company.create! valid_attributes
      delete :destroy, params: { id: company.to_param }, session: valid_session
      expect(response).to redirect_to(companies_url)
    end
  end
end
