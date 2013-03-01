module Shared::Presentators
  
  def name
    "Undefined"
  end
end

module Shared::Presentators::CatalogListPreview
  
  def first_field
    title
  end
  
  def descriptor_field
  end
  
  def second_field
    I18n.t("activerecord.models.#{self.class.to_s.downcase}")
  end
  
  def extra
    I18n.t('formatting.currency', :quantity => price)
  end
  
  def image_field
    return nil if pictures.empty?
    pictures.first.image.thumbnail
  end
  
end