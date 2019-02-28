# frozen_string_literal: true

module ApplicationHelper

  def menu_link_class_for_path(path)
    'active' if current_page?(path)
  end

  def formatted_date(datetime, show_day_name = false)
    return nil if datetime.nil?
    format = '%B %d, %Y'
    format = '%A, ' + format if show_day_name
    datetime.strftime format
  end

  def days_ago(time)
    now = Time.now
    ((now - time) / 1.day).ceil
  end

  def days_ago_string(days_ago)
    days_ago_string = days_ago == 1 ? 'day' : 'days'
    "#{days_ago} #{days_ago_string}"
  end

  def days_left_for_free_trial(days_since_sign_up)
    free_trial_period_length = MyProject::Application.config.free_trial_period_length
    [free_trial_period_length - days_since_sign_up, 0].max
  end

  def currency(decimal)
    return nil if decimal.nil?
    number_to_currency(decimal).gsub(/\.0{1,2}$/, '')
  end

  def options_for_state_select(form)
    options_for_select(states_for_select, form.object.state)
  end

  def page_title(title)
    title.blank? ? _('My Project') : title
  end

  def states_for_select
    [
      nil,
      'Alabama',
      'Alaska',
      'Arizona',
      'Arkansas',
      'California',
      'Colorado',
      'Connecticut',
      'Delaware',
      'Florida',
      'Georgia',
      'Hawaii',
      'Idaho',
      'Illinois',
      'Indiana',
      'Iowa',
      'Kansas',
      'Kentucky',
      'Louisiana',
      'Maine',
      'Maryland',
      'Massachusetts',
      'Michigan',
      'Minnesota',
      'Mississippi',
      'Missouri',
      'Montana',
      'Nebraska',
      'Nevada',
      'New Hampshire',
      'New Jersey',
      'New Mexico',
      'New York',
      'North Carolina',
      'North Dakota',
      'Ohio',
      'Oklahoma',
      'Oregon',
      'Pennsylvania',
      'Rhode Island',
      'South Carolina',
      'South Dakota',
      'Tennessee',
      'Texas',
      'Utah',
      'Vermont',
      'Virginia',
      'Washington',
      'Washington D.C.',
      'West Virginia',
      'Wisconsin',
      'Wyoming'
    ]
  end

end
