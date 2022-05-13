require 'spec_helper'

describe Ticket do
  let(:ticket) { create :ticket }
  it 'should returns route title' do
    expect(ticket.route_title).to eq 'test route'
  end
end