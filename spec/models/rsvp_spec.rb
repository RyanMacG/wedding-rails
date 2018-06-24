require 'rails_helper'

RSpec.describe Rsvp, type: :model do
  context '#extra_guests?' do
    context 'with extra guests' do
      let(:rsvp) { create(:rsvp, number_of_guests: 1) }

      it 'returns true' do
        expect(rsvp.extra_guests?).to eq(true)
      end
    end

    context 'with no guests' do
      let(:rsvp) { create(:rsvp) }

      it 'returns false' do
        expect(rsvp.extra_guests?).to eq(false)
      end
    end
  end
end
