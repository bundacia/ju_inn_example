require 'rspec'
require_relative 'item'

describe Item, '#daily_update' do

  it "lowers the sell by date by 1" do
    item = Item.new('beer', quality: 10, sell_in: 5)
    item.daily_update
    item.sell_in.should == 4
  end

  it "lowers the quality by 1 before the sell by date" do
    item = Item.new('beer', quality: 10, sell_in: 5)
    item.daily_update
    item.quality.should == 9
  end

  it "lowers the quality by 2 after the sell by date" do
    item = Item.new('beer', quality: 10, sell_in: -1)
    item.daily_update
    item.quality.should == 8
  end

  it "won't lower the quality below zero" do
    item = Item.new('beer', quality: 0, sell_in: 5)
    item.daily_update
    item.quality.should == 0
  end

  it "increases quality of cheese by 1 every day" do
    item = Item.new('cheese', quality: 5, sell_in: 4)
    item.daily_update
    item.quality.should == 6
  end
end
