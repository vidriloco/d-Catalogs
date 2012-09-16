module ApplicationHelper
  
  def select_bootstrap_calendar_for(date=nil)
    date_format = "%d-%m-%Y"
    date_str = date == nil ? Date.today.strftime(date_format) : date.strftime(date_format)
    "<div class='input-append date' id='datepicker' data-date='#{date_str}' data-date-format='dd-mm-yyyy'>
		    <input id='date_text' size='16' type='text' value='#{date_str}' name='date[text]' readonly>
		    <span class='add-on'><i class='icon-th'></i></span>
		</div>".html_safe
  end
  
  def associated_record_for(record)
    "<span class='connective'>#{t('connectives.for')}</span> <span class='category'>#{t("activerecord.models.#{record.class.to_s.underscore}")}</span> : <span class='name'>#{record.name}</span>".html_safe
  end
  
  def errors_for(resource, fields)
    output=String.new
    if fields && fields.length > 0
      output << " :<br>"
      fields.each do |field|
        val = resource.errors[field][0]
        output << " <i>#{val}</i>," unless val.blank?
      end
      output.chop.html_safe
    end
  end
  
  def should_render_section(views, section)
    return views.index(section)
  end
end
