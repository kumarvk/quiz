# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the BudgetsHelper. For example:
#
# describe BudgetsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do

  describe '#menu_link_class_for_path' do
    let(:path) { '#/#' }

    context 'when current_page? returns true' do
      before { allow(helper).to receive(:current_page?).with(path) { true } }

      it 'returns active' do
        expect(helper.menu_link_class_for_path(path)).to eq 'active'
      end
    end

    context "when current_page? doesn't return true" do
      before { allow(helper).to receive(:current_page?).with(path) { false } }

      it 'returns active' do
        expect(helper.menu_link_class_for_path(path)).to eq nil
      end
    end
  end

  describe '#days_ago' do
    context 'when creation is less than one day ago' do
      let(:created_at) { Time.now - 6.hours }

      it 'returns 1' do
        expect(helper.days_ago(created_at)).to eq 1
      end
    end

    context 'when creation is more than one day ago' do
      let(:created_at) { Time.now - 1.day - 6.hours }

      it 'returns 2' do
        expect(helper.days_ago(created_at)).to eq 2
      end
    end
  end

  describe '#days_ago_string' do
    it 'returns 1 day' do
      expect(helper.days_ago_string(1)).to eq '1 day'
    end

    it 'returns 2 days' do
      expect(helper.days_ago_string(2)).to eq '2 days'
    end
  end

  describe '#days_left_for_free_trial' do
    it 'returns 20 if argument is 1' do
      expect(helper.days_left_for_free_trial(1)).to eq 13
    end

    it 'returns 14 if argument is 7' do
      expect(helper.days_left_for_free_trial(7)).to eq 7
    end

    it 'returns 1 if argument is 20' do
      expect(helper.days_left_for_free_trial(20)).to eq 0
    end

    it 'returns 0 if argument is 21' do
      expect(helper.days_left_for_free_trial(21)).to eq 0
    end

    it 'returns 0 if argument is 22' do
      expect(helper.days_left_for_free_trial(22)).to eq 0
    end
  end

  describe '#currency' do
    it 'returns a well formatted currency' do
      expect(helper.currency(5.4874)).to eq '$5.49'
    end

    it 'returns nil if argument is nil' do
      expect(helper.currency(nil)).to eq nil
    end
  end

  describe '#formatted_date' do
    it 'returns date without day if only date is given' do
      expect(helper.formatted_date(Time.new(2016, 2, 1))).to eq 'February 01, 2016'
    end

    it "returns date with day if called with 'true' as seconds argument" do
      expect(helper.formatted_date(Time.new(2016, 2, 1), true)).to eq 'Monday, February 01, 2016'
    end

    it 'returns nil if date is nil' do
      expect(helper.formatted_date(nil)).to eq nil
    end
  end

end
