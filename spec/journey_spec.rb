require 'journey'
describe Journey do
  describe '#initialize' do
    it 'assumes the user does not begin in journey' do
      expect(subject.in_journey).to eq false
    end
  end

  describe '#touch_in' do
    it { is_expected.to respond_to :touch_in }

    it 'shows user has started a journey' do
      expect(subject.touch_in).to eq true
    end
  end

  describe '#touch_out' do
    it { is_expected.to respond_to :touch_out }

    it 'shows user has ended journey' do
      expect(subject.touch_out).to eq false
    end
  end
end
