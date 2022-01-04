import time
from selenium import webdriver

browser = webdriver.Chrome("./chromedriver")
browser.maximize_window() # 창 최대화

# Go to Hisnet
browser.get("https://hisnet.handong.edu/login/login.php")
time.sleep(1)

browser.find_element_by_xpath('//*[@id="loginBoxBg"]/table[2]/tbody/tr/td[5]/form/table/tbody/tr[3]/td/table/tbody/tr/td[1]/table/tbody/tr[1]/td[2]/span/input').send_keys("Enter igajfoiehfesdjljfoiasd")
time.sleep(3)

browser.find_element_by_xpath('//*[@id="loginBoxBg"]/table[2]/tbody/tr/td[5]/form/table/tbody/tr[3]/td/table/tbody/tr/td[1]/table/tbody/tr[3]/td[2]/input').send_keys("dslifjapeiohjgodfjawieo")
time.sleep(3)

browser.find_element_by_xpath('//*[@id="loginBoxBg"]/table[2]/tbody/tr/td[5]/form/table/tbody/tr[3]/td/table/tbody/tr/td[2]/input').click()
time.sleep(3)

browser.find_element_by_xpath('//*[@id="td_box22_img"]').click()
time.sleep(1)

browser.find_element_by_xpath('/html/body/table[2]/tbody/tr/td[1]/table[1]/tbody/tr/td[2]/div/a/img').click()
time.sleep(1)
