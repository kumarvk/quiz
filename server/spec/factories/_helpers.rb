# frozen_string_literal: true

FactoryGirl.define do

  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :first_name do |n|
    "Thomas#{n}"
  end

  sequence :last_name do |n|
    "Commas#{n}"
  end

  sequence :phone_number do |n|
    "+49 (0) 30 4845261#{n}"
  end

  sequence :address do |n|
    "Kurfürstendamm #{n}"
  end

  sequence :paypal_subscription_id do |n|
    "some-id-32ntjh2ldk#{n}"
  end

end
