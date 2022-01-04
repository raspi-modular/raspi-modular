package main;

use 5.018;
use feature qw( lexical_subs );

use strict;
use warnings;
use utf8;
use RPi::I2C;
use EV;
use AnyEvent;
use AnyEvent::MQTT;

my $piusv_device = RPi::I2C->new(0x18);

say $piusv_device->check_device(0x18);

my $i2c_timer = AnyEvent->timer (
	after => 0,
	interval => 1,
	cb => sub {
		# read status
		my $status = $piusv_device->read_byte(0x00);
		my @values = $piusv_device->read_bytes(10, 0x02);
		say join ':', @values;
		my ($battery, $current, $voltage, $voltage_usb, $voltage_external) = unpack ('n5', @values);
		say $battery;
		say $current;
		say $voltage;
		say $voltage_external;
	},
);

my $quit = AnyEvent->condvar;
$quit->recv();

1;