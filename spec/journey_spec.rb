require 'journey'
describe Journey do
  describe '#initialize' do
    it 'assumes the user does not begin in journey' do
      expect(subject.in_journey).to eq false
    end
  end

  describe '#touch_in' do
    it 'shows user has started a journey' do
      min_fare = Journey::MINFARE
      subject.instance_variable_set(:@balance, min_fare)
      subject.touch_in
      expect(subject.touch_in).to eq true
    end

    it 'raises error if insufficient funds touch in' do
      expect { subject.touch_in }.to raise_error 'Insufficient funds'
    end
  end

  describe '#touch_out' do
    it 'shows user has ended journey' do
      expect(subject.touch_out).to eq false
    end

    it 'deducts money from users card' do
      min_fare = Journey::MINFARE
      subject.instance_variable_set(:@balance, min_fare)
      expect{ subject.touch_out }.to change{ subject.balance }.by -min_fare
    end
  end
end
