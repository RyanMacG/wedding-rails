require 'rails_helper'

RSpec.describe Rsvp, type: :model do
  context 'updating the guest name' do
    context 'with .name_updatable set to false' do
      let(:guest) {
        create(
          :guest,
          name: 'Euan Changeable',
          attending: true
        )
      }

      before do
        guest.update!(name: 'Joe Bloggs')
      end

      it 'does not update the name' do
        expect(guest.name).to eq('Euan Changeable')
      end

      it 'does not lose the other changes' do
        expect(guest.attending).to eq(true)
      end
    end

    context 'with .name_updatable set to true' do
      let(:guest) { create(:guest, name: 'Euan Changeable', name_updatable: true) }

      before do
        guest.update!(name: 'Joe Bloggs')
      end

      it 'does not update the name' do
        expect(guest.name).to eq('Joe Bloggs')
      end
    end
  end
end