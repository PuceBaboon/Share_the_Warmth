# Share_the_Warmth
A **PIC18F27J53** based, forced-air circulation controller, written in **JALv2**.

This is a project in-process.  Don't expect everything (*anything?*) here to actually work.

If you're going to follow along, you'll need some method of programming mid- and low-range PIC microcontrollers and you should also have the JALLIB package installed (to provide all of the basic library functions).  The JALLIB package already includes the JALv2 compiler.

The original direction of this project was to use the PIC18F27J53 as the master controller, talking to a couple of low-end PIC12F1840's over an I2C bus.  However, with the introduction of the ESP8266 series of very low cost, wireless microcontrollers that has now changed to include multiple ESP8266 remote stations (instead of the PIC12 modules) all communicating with the master.

![](https://cloud.githubusercontent.com/assets/10677593/7465295/7fafaf9e-f308-11e4-817f-369682c55f99.jpg)

Our PIC18 master controller takes care of PWM control (basically a very simple swich-mode Buck regulator) of two, 200mm, low RPM, 12v fans.  The fans move warm air from the heated part of the house through ducts to the colder areas.  The remote stations (the ESP8266 modules) have DS18S20, one-wire temperatue sensors attached and report back to the master controller.  The master runs an RTC and, based upon programmed schedule settings, will start and stop the fans and vary their RPM to govern airflow and noise (the fans are rated at 19db at 700RPM, but are significantly quieter when run at lower RPM).  The tachometer feedback from the fans is also monitored by the master PIC18 to detect fan stalls at low RPM.
