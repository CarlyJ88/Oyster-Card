require 'oystercard'

describe Oystercard do
  
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

    it 'will deduct money from balance' do
      subject.deduct(30)
      expect(subject.balance).to eq -30
    end
  end












end
