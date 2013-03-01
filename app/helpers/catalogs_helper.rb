module CatalogsHelper
  def stock_status_for(klass, tipe=nil)
    if tipe.nil?
      items = klass.count
      tipe = klass.to_s.downcase.pluralize
    else
      items = klass.where(:kind => klass.category_for(:kinds, tipe)).count
      tipe = tipe.to_s.pluralize
    end
    html = "<li><span class='quantity'>#{items}</span><span>#{t("catalogs.items.#{tipe}.#{items == 1 ? 'one' : 'many'}")}</span>"
    html.html_safe
  end
end
