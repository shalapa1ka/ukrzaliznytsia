require 'spec_helper'

describe Admin::TrainsController do
  let(:train) { create :train }

  describe 'GET #index' do
    let(:trains) { create_list(:train, 3) }

    before { get :index }

    it 'populates an array of all trains' do
      expect(assigns(:trains)).to match_array(trains)
    end

    it 'renders index view' do
      expect(response).to render_template admin_trains_path
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: train } }

    it 'assings the requested train to @train' do
      expect(assigns(:train)).to eq train
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
end