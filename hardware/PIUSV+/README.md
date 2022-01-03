Die PIUSV+ kann per I2C-Schnittstelle über die Adresse "0x18" angesprochen werden.

"Status lesen"              0x00   danach muss 1 Byte (Statusregister) gelesen werden
                                   Die einzelnen Bits des Statusregister haben folgende Bedeutung:
                                     Bit0:  Primäre Spannungsversorgung (5V) aktiv
                                     Bit1:  Sekundäre Spannungsversorgung (5V...25V) aktiv
                                     Bit2:  Akkuspannung zu niedrig
                                     Bit3:  Akku wird geladen
                                     Bit4:  Akku ist voll
                                     Bit5:  Taster S1 an der USV betätigt

"Firmare Version lesen"     0x01   danach müssen 12 Bytes (Zeichen) gelesen werden

"Werte lesen"               0x02   danach müssen 10 Byte gelesen werden
                                   Die zu lesenden Bytes haben folgende Reihenfolge und Bedeutung:
	                             HIGH_BYTE (UINT) Akku-Spannung in mV	
	                             LOW_BYTE  (UINT) Akku-Spannung in mV
                                     HIGH_BYTE (UINT) Strom in mA, der zum Raspberry Pi fließt
                                     LOW_BYTE  (UINT) Strom in mA, der zum Raspberry Pi fließt
                                     HIGH_BYTE (UINT) 5V-Versorgungsspannung in mV (USV-Spannungversorung für Raspberry Pi)
                                     LOW_BYTE  (UINT) 5V-Versorgungsspannung in mV (USV-Spannungversorung für Raspberry Pi)
                                     HIGH_BYTE (UINT) Spannung in mV am Micro USB-Stecker der USV (primäre Spannungsversorgung)
                                     LOW_BYTE  (UINT) Spannung in mV am Micro USB-Stecker der USV (primäre Spannungsversorgung)
                                     HIGH_BYTE (UINT) Spannung in mV externe Spannungsversorgung (sekundäre Spannungsversorgung)
                                     LOW_BYTE  (UINT) Spannung in mV externe Spannungsversorgung (sekundäre Spannungsversorgung)

"USV-Abschaltung auslösen"  0x10   danach muss 1 Byte geschrieben werden
                                   Folgende Werte sind möglich:
                                     0x00 (default Wert): USV wird nach einer Zeit von 30sec. abgeschaltet
                                     0x01...0xFF:	  USV wird nach einer Zeit von 1...255 Sekunden abgeschaltet
                                   Anmerkung: Durch das zeitverzögerte Auschalten der USV kann sichergestellt werden,
                                              dass ein zuvor ausgelöster Shutdown des Raspberry Pi abgeschlossen ist.