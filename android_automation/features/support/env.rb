require "appium_lib"
require "pry"

def caps
    {
        caps: {
            deviceName: "Brian",
            platformName: "Android",
            app: (File.join(File.dirname(__FILE__), "PreciseUnitConversion.apk")),
            appPackage: "com.ba.universalconverter",
            appActivity: "MainConverterActivity",
            newCommandTimeout: "3600"
        }
    }
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object

def find_in_list(string)
    3.times {Appium::TouchAction.swipe(start_x: 0.5, start_y: 0.2, end_x: 0.5, end_y: 0.8, duration: 600).perform}
    current_screen = get_source
    previous_screen = ""
    until (exists{ text(string) }) || (current_screen == previous_screen) do
        Appium::TouchAction.swipe(start_x: 0.5, start_y: 0.8, end_x: 0.5, end_y: 0.2, duration: 600).perform
        previous_screen = current_screen
        current_screen = get_source
    end
    if exists{ text(string)}
        text(string).click
    else
        fail("#{string} is not on the list")
    end
end