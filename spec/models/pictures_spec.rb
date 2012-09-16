require 'spec_helper'

describe Picture do
  it "Can initialize a new record with an associated book" do
    book = Fabricate(:book)
    picture = Picture.new_with(:book_id => book.id)
    
    picture.imageable_id.should == book.id
    picture.imageable_type.should == book.class.to_s
    picture.imageable.should == book
  end
  
  it "Can initialize a new record with an associated pre sale" do
    presale = Fabricate(:pre_sale)
    picture = Picture.new_with(:pre_sale_id => presale.id)
    
    picture.imageable_id.should == presale.id
    picture.imageable_type.should == presale.class.to_s
    picture.imageable.should == presale
  end
  
  it "Can initialize a new record with an associated item" do
    item = Fabricate(:item)
    picture = Picture.new_with(:item_id => item.id)
    
    picture.imageable_id.should == item.id
    picture.imageable_type.should == item.class.to_s
    picture.imageable.should == item
  end
end