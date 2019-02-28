# frozen_string_literal: true

FastGettext.add_text_domain 'my_project', path: 'locale', type: :po
FastGettext.default_available_locales = ['en']
FastGettext.default_text_domain = 'my_project'
