require 'watir'
require 'cucumber'
require 'test/unit'

Given(/^a Chrome web browser$/) do
  #visit ValuesPage
  @WEBSITE = 'https://www.exercise1.com/values'
  #@WEBSITE = 'C:/Users/Philip/RubymineProjects/insight/insight.html' # local html file for test spec
  @browser = Watir::Browser.new :chrome
end

And(/^a list of label and text field names$/) do
  @LABELS = [
      #"no_label", # negative test
      "lbl_val_1",
      "lbl_val_2",
      "lbl_val_3",
      "lbl_val_4",
      "lbl_val_5",
      "lbl_ttl_val"
  ]

  @TEXT_FIELDS = [
      #"no_txt_val", # negative test
      "txt_val_1",
      "txt_val_2",
      "txt_val_3",
      "txt_val_4",
      "txt_val_5",
      "txt_ttl_val"
  ]

  @TOTAL_FIELD_NAME = "txt_ttl_val"
end

When(/^a user loads the values website$/) do
  @browser.goto("#{@WEBSITE}")
end

Then(/^the user should see six text labels$/) do
  # iterate through label names, assert label by name exists
  Array(@LABELS).each {|label|
    assert @browser.label(:for, "#{label}").exist?
    #@browser.label(:for, "#{label}").should exist
  }
end

And(/^the user should see six text fields$/) do
  # iterate through field names, assert a text field by the name exists
  Array(@TEXT_FIELDS).each {|text_field|
    assert @browser.text_field(:name, "#{text_field}").exist?
    #@browser.text_field(:name, "#{text_field}").should exist
  }
end

And(/^the text field values are formatted as positive currency numbers$/) do
  # regex patterns for currency formats
  currency_cents = /^\$0\.\d{2}$/ # this handles 0 dollars and 00-99 cents
  currency = /^\$[1-9][0-9]*\.\d{2}$/ # this handles no commas in dollars with 00-99 cents
  currency_commas = /^\$([1-9]\d{0,2},)*\d{3}\.\d{2}$/ # this handles commas in dollars with 00-99 cents

  # iterate through field values
  Array(@TEXT_FIELDS).each {|text_field|
    value = @browser.text_field(:name => "#{text_field}").value

    # assert the value string matches one regex above
    assert ((value.match currency_cents) ||
        (value.match currency) ||
        (value.match currency_commas))
  }
end


And(/^the value of "([^"]*)" is the sum of the other text field values$/) do |total_field_name|
  # get the total value, cast to float
  total_text_value = @browser.text_field(:name => "txt_ttl_val").value
  total_text_value = @browser.text_field(:name => "#{@TOTAL_FIELD_NAME}").value
  total = total_text_value.gsub(/[,$]/, ',' => '', '$' => '').to_f

  # get sum of other field values
  sum = 0.00

  Array(@TEXT_FIELDS).each {|text_field|

    if (text_field != @TOTAL_FIELD_NAME) # conditional to ignore the total field
      # get each field value and add to sum
      text_value = @browser.text_field(:name => "#{text_field}").value
      value = text_value.gsub(/[,$]/, ',' => '', '$' => '').to_f
      sum += value
    end
  }

  assert (sum == total)
end