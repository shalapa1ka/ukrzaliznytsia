require 'rails_helper'

describe TicketsController do
  let(:ticket) { create :ticket }
  let(:invalid_ticket) { create :invalid_ticket }
  let(:route) { create :route }
  let(:rw) { create :railway_station }
  let(:user) { create :user }
  let(:admin) { create :user, admin: true }

  describe 'GET #index' do
    before { get :index }
    let(:tickets) { create_list :ticket, 3 }

    it 'populates an array of all tickets in system for admin' do
      expect(assigns(:tickets)).to eq tickets
    end

    it 'populates an array of all current user tickets for user' do
      #todo
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

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
    context 'with valid attributes' do
      it 'saves the new ticket in the database' do
        expect { post :create, params: { ticket: ticket } }.to change(Ticket, :count).by(1)
      end

      it 'redirect to show view' do
        post :create, params: { ticket: ticket }
        expect(response).to redirect_to Ticket.last
      end
    end

    context 'with invalid attributes' do
      it 'does not save the ticket' do
        expect { post :create, params: { ticket: invalid_ticket } }.to_not change(Ticket, :count)
      end

      it 're-renders new view'
    end

  end

end