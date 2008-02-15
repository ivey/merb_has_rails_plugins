require File.dirname(__FILE__) + '/../spec_helper'
require 'merb_has_flash/flash_hash'

describe "merb_has_flash FlashHash" do
  before(:each) do
    @hash = MerbHasFlash::FlashHash.new
  end
  
  it "should be a kind of Hash" do
    @hash.should be_a_kind_of(Hash)
  end
  
  it "should initialize an empty @used hash" do
    @hash.instance_variable_get(:@used).should == {}
  end
  
  it "should have more specs" do
    
  end
  
  it "should copy-and-paste most of this from Rails" do
    
  end
end