# Linux Nextion RTC support

Linux misses support for the Nextion RTC. By adding a systemd unit, actual date and time is updaded to the pi, even if there is no network connection available.

## Preparation

```
sudo apt-get install libdevice-serialport-perl
sudo apt-get install libposix-2008-perl
```

## Configuration

Check which serial port the nextion display is connected to. Check also what baudrate the Nextion is configured to use.