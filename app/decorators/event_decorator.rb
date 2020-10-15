class EventDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def event_state
    if !model.attendees.include?(current_user) && model.date >= Date.today
      h.link_to 'Attend Event', add_events_attending_path(model, idz: model.id), method: :post, class: ''
    elsif model.attendees.include?(current_user)
      h.link_to 'Unattend Event', rem_events_attending_path(mosel, idz: model.id), method: :post, class: ''
    else
      h.content_tag(:span, 'Passed', class: 'text-danger')
    end
  end
end
