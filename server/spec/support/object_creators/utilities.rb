# frozen_string_literal: true

def set_association_id(options_hsh, association_name)
  id_symbol = (association_name.to_s + '_id').to_sym

  if options_hsh[association_name]
    options_hsh[id_symbol] = options_hsh[association_name].id
    options_hsh.delete(association_name)
  elsif !options_hsh[id_symbol]
    options_hsh[id_symbol] = send(('create_' + association_name.to_s).to_sym).id
  end
end
