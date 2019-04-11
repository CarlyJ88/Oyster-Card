require 'oystercard'

describe Oystercard do
  let(:station_name) { double :station_name }
  it 'responds to balance' do
    expect(subject).to respond_to :balance
  end
  
  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'will raise error if balance exceeds £90' do
      subject.top_up(90)
      expect{ subject.top_up(1) }.to raise_error "Top up limit exceeded #{Oystercard::MAXLIMIT}"
    end 

    describe '#initialize' do
      it 'assumes the user does not begin in journey' do
        expect(subject.in_journey).to eq false
      end
    end
  end
  
    describe '#touch_in' do
      it 'raises error if insufficient funds touch in' do
        expect { subject.touch_in(station_name) }.to raise_error 'Insufficient funds'
      end
  
      it 'remembers the entry station' do
        min_fare = Oystercard::MINFARE
        subject.instance_variable_set(:@balance, min_fare)
        subject.touch_in(station_name)
        expect(subject.entry_station).to eq station_name
      end
    end
  
    describe '#touch_out' do
      it 'shows user has ended journey' do
        subject.top_up(50)
        subject.touch_in(station_name)
        subject.touch_out
        expect(subject.in_journey?).to eq false
      end
  
      it 'deducts money from users card' do
        min_fare = Oystercard::MINFARE
        subject.instance_variable_set(:@balance, min_fare)
        expect{ subject.touch_out }.to change{ subject.balance }.by -min_fare
      end

      it 'forgets station name on touch out' do
        subject.top_up(10)
        subject.touch_in(station_name)
        subject.touch_out
        expect(subject.entry_station).to eq nil
      end
    end

    describe '#in_journey' do
      it 'returns true if station has value' do
        min_fare = Oystercard::MINFARE
        subject.instance_variable_set(:@balance, min_fare)
        subject.touch_in(station_name) 
        expect(subject.in_journey?).to eq true
      end
    end
  end
