Given /^the following gems:$/ do |gems|
  Gem.create!(gems.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) gem$/ do |pos|
  visit gems_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following gems:$/ do |expected_gems_table|
  expected_gems_table.diff!(tableish('table tr', 'td,th'))
end
