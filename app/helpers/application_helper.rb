module ApplicationHelper
  
  def select_bootstrap_calendar_for(date=nil)
    date_format = "%d-%m-%Y"
    date_str = date == nil ? Date.today.strftime(date_format) : date.strftime(date_format)
    "<div class='input-append date' id='datepicker' data-date='#{date_str}' data-date-format='dd-mm-yyyy'>
		    <input id='date_text' size='16' type='text' value='#{date_str}' name='date[text]' readonly>
		    <span class='add-on'><i class='icon-th'></i></span>
		</div>".html_safe
  end
end
