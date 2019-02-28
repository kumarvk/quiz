# frozen_string_literal: true

def random
  rand(2) == 0
end

def random_email
  random_word.downcase + '@' + random_word.downcase + '.' + random_domain_ending
end

def random_url
  subdomain = random ? 'www.' : ''
  random_scheme + subdomain + random_word.downcase + '.' + random_domain_ending
end

def random_name
  random_word.capitalize
end

def random_decimal
  rand(999_999) / 100.0
end

def random_phone_number
  number = ''
  10.times do
    number += rand(10).to_s
  end
  number
end

def random_char
  case rand(3)
  when 0 then rand(10).to_s
  when 1 then random_letter_downcase
  when 2 then random_letter_upcase
  end
end

def random_ip
  "#{rand(255)}.#{rand(255)}.#{rand(255)}.#{rand(255)}"
end

def random_country
  %w[GERMANY AUSTRIA SWISS NETHERLANDS SPAIN UNITED-STATES].sample
end

def random_scheme
  %w[http https].sample + '://'
end

def random_word(min_length = 2, max_length = 15)
  length = rand(max_length - min_length) + min_length
  random_word = ''
  length.times do
    random_word += random_letter
  end
  random_word
end

def random_token
  token = ''
  (rand(50) + 5).times { token += random_char }
  token
end

def random_text
  amount_of_words = rand(40 - 1) + 1
  text = ''
  amount_of_words.times { text += random_word + ' ' }
  text[0...-3]
end

def random_password
  random_word 6
end

def random_letter
  random ? random_letter_downcase : random_letter_upcase
end

def random_letter_downcase
  %w[a b c d e f g h i j k l m n o p q r s t u v w x y z].sample
end

def random_letter_upcase
  %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z].sample
end

def random_domain_ending
  %w[com co at co.uk de fr ch io es net org info].sample
end
