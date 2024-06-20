## BatteryText

BatteryText allows you to change the text of your battery percentage to anything you want, including prebuilt themes and an option for completely custom text.

![battery text](./screenshots/battery.jpg?raw=true)

![settings](./screenshots/settings.jpg?raw=true)

![themes](./screenshots/themes.jpg?raw=true)

**Requirements**
* Jailbroken iOS device on iOS 14 (untested on other versions, but likely functional on neighboring versions)
* OpenSSH installed on device

**Installation**

The steps to install the tweak onto your iOS device can be found below:

* Clone repo to your local machine
```
git clone https://github.com/napolit7/BatteryText.git
```
* Copy the provided debian archive to your local iOS device. You will be prompted to enter your root password, which is alpine if you did not change it manually.
```
cd BatteryText/packages
scp com.napolit7.batterytext_1.3.1_iphoneos-arm.deb root@LOCAL.DEVICE.IP:/tmp
```
* SSH into your device and install the package. The final command will respring your device for you.
```
ssh root@LOCAL.DEVICE.IP
cd /tmp
dpkg -i com.napolit7.batterytext_1.3.1_iphoneos-arm.deb
killall -9 SpringBoard
```
* Once your device finishes resprining, you can open settings and modify the BatteryText settings! You will need to press the Respring button to apply any changes.
