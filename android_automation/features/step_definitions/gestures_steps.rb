When("I swipe from left to right") do
    Appium::TouchAction.swipe(start_x: 0.01, start_y: 0.6, end_x: 0.8, end_y: 0.6, duration: 600).perform
end

Then("When I swipe from right to left") do
    Appium::TouchAction.swipe(start_x: 0.99, start_y: 0.6, end_x: 0.01, end_y: 0.6, duration: 300).perform
end

