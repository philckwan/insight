require 'watir'
require 'cucumber'
require 'test/unit'

Given(/^a user goes to Google$/) do
  @browser = Watir::Browser.new :chrome
  @browser.goto "https://www.google.com"
end

When (/^they search for "([^"]*)"$/) do |search_term|
  @browser.text_field(:id, "lst-ib").set "#{search_term}"
  @browser.send_keys :return
end

Then /^Google should return results for "([^"]*)"$/ do |expected_search_term|
  actual_search_term = @browser.text_field(:id => "lst-ib").value
  assert(actual_search_term == "#{expected_search_term}")
  @browser.close
end