require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
 
class SampleTest < Test::Unit::TestCase
  def setup
    USERNAME=''
    BROWSERSTACK_ACCESS_KEY=''
    if USERNAME == ''
      puts "Please add USERNAME & BROWSERSTACK_ACCESS_KEY in this file"
      exit
    end
    url = "http://#{USERNAME}:#{BROWSERSTACK_ACCESS_KEY}@hub.browserstack.com/wd/hub"
    @driver = Selenium::WebDriver.for(:remote, :url => url)
  end
 
  def test_post
    @driver.navigate.to "http://www.google.com"
    element = @driver.find_element(:name, 'q')
    element.send_keys "BrowserStack"
    element.submit
    sleep 0.1
    assert_equal(@driver.title, "BrowserStack - Google Search")
  end
 
  def teardown
    @driver.quit
  end
end
