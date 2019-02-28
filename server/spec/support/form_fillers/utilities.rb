# frozen_string_literal: true

def check_for_field(field_name, value)
  case value
  when nil then expect(rendered).to have_field(field_name)
  else expect(rendered).to have_field(field_name, with: value)
  end
end
