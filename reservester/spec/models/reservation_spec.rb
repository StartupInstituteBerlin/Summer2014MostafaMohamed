require 'spec_helper'

describe Reservation do

  describe "#is_valid" do
  	before(:each) do
  	  @r = Reservation.new
  	end

    it "returns false when email is empty" do
      @r.email = ''
      @r.valid?.should be_false
    end

    it "returns false when email is invalid" do
      @r.email = 'invalid@email'
      @r.valid?.should be_false	
    end

    it "returns true when email is valid with at and stuff" do
      @r.email = 'valid@email.com'
      @r.valid?.should be_true
    end
  end
end
