module ApplicationHelper
  def submit_cancel(form, name="Cancel")
    form.submit + " " + link_to(name, 'javascript:history.go(-1);', {:class => 'cancel'})
  end
end
