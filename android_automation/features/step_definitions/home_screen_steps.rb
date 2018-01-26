
Then("Left Unit picker value should be {string}") do |string|
    actual_picker_text = find_elements(id: "select_unit_spinner")[0].text

    if actual_picker_text != string
      fail("Expected unit picker value is "+ string + ", actual unit picker value is "+ actual_picker_text)
    end
end

Then("Right Unit picker value should be {string}") do |string|
  actual_picker_text = find_elements(id: "select_unit_spinner")[1].text

    if actual_picker_text != string
      fail("Expected unit picker value is "+ string + ", actual unit picker value is "+ actual_picker_text)
    end
end

Then(/^Show All button should be (enabled|disabled)$/) do |state|
  button_state = find_element(id: "btn_show_all").enabled?
  if state == "enabled" && !button_state
      fail("button is disabled")
  elsif state == "disabled" && button_state
      fail("button is enabled")
  end
end

When("I type {string} on application keyboard") do |target|
  target.split("").each do |num|
    find_element(id: "keypad").find_element(xpath: "//android.widget.Button[@text='#{num}']").click
  end
end

Then("I should see result as {string}") do |result|
  if find_element(id: "target_value").text != result
    fail("Result doesn't match expected result")
  end
end

Then("I press on Add to Favorites icon") do
  find_element(id: "action_add_favorites").click
end

Then("I press on Favorite conversions") do
  text("Favorite conversions").click
end

Then("I verify {string} added to Favorite conversions list") do |string|
  if find_element(id: "favorites_item_hint").text != string
    fail("cannot find conversion")
  end
end

Then("I press on search icon") do
  find_element(id: "action_search").click
end

Then("I select {string} from left unit picker") do |string|
  find_elements(id: "select_unit_spinner")[0].click
  find_in_list(string)
end

Then("I select {string} from right unit picker") do |string|
  find_elements(id: "select_unit_spinner")[1].click
  find_in_list(string)
end

Then("I type {string} in search field") do |string|
  find_element(id: "search_src_text").send_keys(string)
end

Then("I press return button on soft keyboard") do
  Appium::TouchAction.new.tap(x:0.99,y:0.99, count: 1).perform
end

Then("I see {string} as a current unit converter") do |string|
  find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='#{string}']")
end

Then("I select {string} from menu") do |string|
  find_in_list(string)
end
When("I press on switch units button") do
  find_element(id: "img_switch").click
end

Then("I should see text {string}") do |string|
  text(string)
end

Then("I verify that {int}st result in history list is {string}") do |int, string|
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line")
  actual_text = array_of_elements[int.to_i - 1].find_element(id: "history_item_hint").text
  if actual_text != string
    fail("Expected text is "+ string+ " actual text is "+ actual_text)
  end
end

When("I press delete from history at {int}st row") do |int|
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line")
  array_of_elements[int.to_i - 1].find_element(id: "deleteIcon").click
end

When("I press on options icon") do
  find_element(id: "action_bar").find_element(xpath: "//android.support.v7.widget.LinearLayoutCompat").find_element(xpath: "//android.widget.ImageView").click
end

Then("I press Close on calculator keyboard") do
  find_element(id: "btn_calc_cancel").click
end
