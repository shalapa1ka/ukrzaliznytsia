require 'rails_helper'

describe TicketsController do
  let(:ticket) { create :ticket }
  let(:route) { create :route }
  let(:rw) { create :railway_station }
  let(:user) { create :user }
  let(:admin) { create :user, :admin }

  describe 'GET #show' do
    before { get :show, params: { id: ticket } }

    it 'assings the requested ticket to @ticket' do
      expect(assigns(:ticket)).to eq ticket
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET :new' do
    before { get :new, params: { route_id: route, from: rw, to: rw } }

    it 'assigns a new ticket to @ticket' do
      expect(assigns(:ticket)).to be_a_new(Ticket)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    it 'saves the new ticket in the database' do
      expect { post :create, params: { ticket: ticket } }.to change(Ticket, :count).by(1)
    end

    it 'redirect to show view' do
      sign_in admin
      post :create, params: { ticket: ticket, user: admin }
      expect(response).to redirect_to Ticket.last
    end
  end

end