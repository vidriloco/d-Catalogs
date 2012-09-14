require 'spec_helper'

describe Discount do
  
  it "Can initialize a new record with an associated pre-sale" do
    pre_sale = Fabricate(:pre_sale)
    discount = Discount.new_with(:pre_sale_id => pre_sale.id)
    
    discount.discountable_id.should == pre_sale.id
    discount.discountable_type.should == pre_sale.class.to_s
    discount.discountable.should == pre_sale
  end
  
  it "Can initialize a new record with an associated music box" do
    music_box = Fabricate(:music_box)
    discount = Discount.new_with(:music_box_id => music_box.id)
    
    discount.discountable_id.should == music_box.id
    discount.discountable_type.should == music_box.class.to_s
    discount.discountable.should == music_box
  end
  
  it "Can initialize a new record with an associated book" do
    book = Fabricate(:book)
    discount = Discount.new_with(:book_id => book.id)
    
    discount.discountable_id.should == book.id
    discount.discountable_type.should == book.class.to_s
    discount.discountable.should == book
  end
  
  it "Can initialize a new record with an associated item" do
    item = Fabricate(:item)
    discount = Discount.new_with(:item_id => item.id)
    
    discount.discountable_id.should == item.id
    discount.discountable_type.should == item.class.to_s
    discount.discountable.should == item
  end
  
end