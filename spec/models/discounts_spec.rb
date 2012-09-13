require 'spec_helper'

describe Discount do
  
  it "Can initialize a new record with an associated pre-sale" do
    pre_sale = Fabricate(:pre_sale)
    discount = Discount.new_with(:pre_sale_id => pre_sale.id)
    
    discount.discountable_id.should == pre_sale.id
    discount.discountable_type.should == pre_sale.class.to_s
    discount.discountable.should == pre_sale
  end
  
  
end