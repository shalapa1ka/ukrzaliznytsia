require 'spec_helper'

describe Ticket do
  let(:route) { create :route, title: 'test title' }
  let(:train) { create :train, route: route }
  let(:ticket) { create :ticket, train: train }

  it 'should returns route title' do
    expect(ticket.route_title).to eq 'test title'
  end
end