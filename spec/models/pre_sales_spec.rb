require 'spec_helper'

describe PreSale do
  
  before(:each) do
    @common_fields = {"event"=>"Paquita la del barrio", "description"=>"En el teatro blanquita canta", "price"=>"230", "quantity"=>"10000", "reference_id"=>"22"}
  end
  
  it "Can register a new pre-sale item with a date and it's other required fields" do
    date_fields = {"text"=>"16-02-2012", "year"=>"2012", "month"=>"9", "day"=>"5", "hour"=>"21", "minute"=>"14"}
    presale = PreSale.new_with(@common_fields, date_fields)
    
    lambda { presale.save }.should change(PreSale, :count).from(0).to(1)
    presale.should be_persisted
    presale.date.should == Time.new(2012, 02, 16, 21, 14).utc
  end
    
end
