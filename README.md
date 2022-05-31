# Chameleon-Mini

This is NOT the official repository of ChameleonMini, a freely programmable portable tool for NFC security analysis that can emulate and clone contactless cards, read RFID tags, and sniff/log RF data.

Our Project is based on the open-source project [ChameleonMini RevG](/../../../../emsec/ChameleonMini) by Kasper & Oswald. They also have their own [Webshop](https://shop.kasper.it/).

- Information:
   - Most information can be found: **[Here](http://chameleontiny.com/)**
   - Chameleon BLE API: [**Codes.RAR**](/../../../../RfidResearchGroup/ChameleonBLEAPI/blob/master/code.rar)
- Apps:
   - Android: **[Chameleon](https://play.google.com/store/apps/details?id=com.proxgrind.chameleon)**
   - IOS: **[ChameleonTiny Manager](https://apps.apple.com/us/app/chameleontiny-manager/id1601341565)**
      - Credit to **[bettse](/../../../../bettse)**
   - Password: e4g1
- Resellers:
   - Our Asia & Oceania Reseller: **[Here](https://sneaktechnology.com/)**
   - Our Europe Reseller: **[Here](https://lab401.com/)**
   - Our US Reseller: **[Here](https://hackerwarehouse.com/)**
- Repository Structure:
   - **Doc:** A folder for doxygen documentation
   - **Drivers:** Chameleon drivers for Windows and Linux
   - **Dumps:** Dumps of different smartcards
   - **Hardware:** The layout and schematics of the PCB
   - **Firmware:** The complete firmware including a modified Atmel DFU bootloader and LUFA
   - **Software:** Contains a python tool for an easy configuration (and more) of the ChameleonMini
      - **WARNING:** This is currently under construction
   - **RevE:** Contains the entire contents of the discontinued RevE repository
   - **RevE-light:** Contains our development files for the RevE-light
      - **WARNING:** currently not supported / not functional

## A. Upgrade to the latest firmware

### A1. Upgrade Chameleon AVR Firmware
---

#### 1. Prepare your Windows. Linux, or MAC computer

   1. Prepare the firmware. 
   2. Go to GITHUB to compile the latest firmware: **[Here](/../../../../RfidResearchGroup/ChameleonMini)** 
      - Or use the precompiled [firmware in the release section](/../../../../iceman1001/ChameleonMini-rebooted/releases).
   3. Install the DFU driver. 
      - The DFU driver comes from ATMEL's official LIBUSB driver library. You can download it yourself or find it in the [repo](/../../../../iceman1001/ChameleonMini-rebooted/tree/master/Drivers).

#### 2. Write the firmware
   
   1. Enter the chameleon DFU mode.
      1. When the device is off, press and hold the yellow button near the USB (TINY uses the B button), insert the USB, and then you can enter the DFU upgrade mode. Or send the command `UPGRADE` in the connected state, and it can also enter the DFU upgrade mode.
   2. Start to upgrade the firmware. 
      1. Run the `ChameleonFirmwareUpgrade.bat` file in the repo to automatically start the firmware upgrade. 
      2. It usually takes 2-5 seconds. After the progress bar is complete, the firmware upgrade is complete.

- Note:
   - The chameleon REV.G version uses the same firmware for both the MINI with Bluetooth version and TINY. The hardware design of the RF part is exactly the same. The hardware is also compatible with the official firmware of the [KAOS brothers](/../../../../emsec/ChameleonMini). 
   - The Android APP is currently not compatible with the official firmware.

### A2. Upgrade (OTA) Bluetooth firmware for Chameleon MINI
---

#### 1. Download the APP:

   - Android: **[Chameleon](https://play.google.com/store/apps/details?id=com.proxgrind.chameleon)**
   - IOS: **[ChameleonTiny Manager](https://apps.apple.com/us/app/chameleontiny-manager/id1601341565)**
   - Password: e4g1
   
#### 2. Open the app and connect the device using Bluetooth

   1. Press any button on the MINI and the white battery light should come on. You can now connect via Bluetooth. 
   2. Open the app again and click `Connect` to automatically connect the chameleon.

#### 3. Start the upgrade (OTA) of the Bluetooth firmware

   1. In the `Device Information` column, press `BLE CMD Version` 5 times. 
   2. On the `OTA upgrade` page, click `Auto Upgrade`, and the APP will immediately start to upgrade to the latest Bluetooth firmware that comes with it.
   3. The app will automatically exit after the upgrade is complete.

## B. Crash Course

### B1. Detect keys and upload card files
---

#### 1. Prepare the computer GUI, Android APP, or iOS APP

   1. Tools:
      - Windows GUI: **[Here](http://www.icesql.se/download/ChameleonMiniGUI/publish.htm)**
      - Source: **[Here](/../../../../iceman1001/ChameleonMini-rebootedGUI)**
   2. Download the APP:
      - Android: **[Chameleon](https://play.google.com/store/apps/details?id=com.proxgrind.chameleon)**
      - IOS: **[ChameleonTiny Manager](https://apps.apple.com/us/app/chameleontiny-manager/id1601341565)**
      - Password: e4g1
   3. Connect to the Chameleon MINI or TINY using the APP.
      - Connect via USB

   - Note:
      - Both the Chameleon MINI and TINY support direct connection to the mobile phone USB port. 
         - For the MINI, an additional OTG adapter needs to be purchased. TINY uses its own dual-headed TYPE-C data cable to connect directly to TYPE-C mobile phones.
      - Chameleon MINI has built-in Bluetooth BLE4.0. Press any button first to wake up Bluetooth. Turn `ON` Bluetooth on your phone and the APP will automatically connect.

#### 2. Use APP to enable detection mode

   1. After connecting, click on a single card slot and select `DETECTION_1K` or `4K` in the `card slot mode`. This card slot will now have the detection mode turned on. 
   2. Write the original card number in the `UID Card Number` column. Click `Write`. If you don't know the UID number, you can fill in it at will. 
   3. Then click the `Clear` button below to clear the last detection record.

#### 3. Use the APP to get keys

   1. Take the chameleon to the access control reader and swipe. The key and access traces when the chaser reads the chameleon will be recorded by the chameleon.
   2. Connect back to the mobile phone and press the `crack` button.
   3. After few seconds, the app will automatically solve and list the results, as shown in the figure below:
   
<a href="https://ibb.co/Q6xcVkW"><img src="https://i.ibb.co/Q6xcVkW/Untitled-1.png" alt="Untitled-1" border="0"></a>

   4. The list shows which blocks the read head just visited, and what password was used for each access.
   5. Click the `History` button. The APP will automatically list the keys separately and save them for other software to use.
   6. If your mobile phone comes with an NFC function, you can put the original key directly on the mobile phone.
   7. The APP will automatically use the key in the list to read the entire card, and after it is successful, it will automatically save the entire card data file on the mobile phone.

   - Note: 
      - Multiple red LEDs are on at the same time during detection, which means the memory is full, just clear the memory.

#### 4. Use Android APP to import existing card data files in batches.

   1. Use QQ to send the card data file to the mobile phone QQ, or connect the mobile phone to the computer and transfer the file to any directory on the mobile phone.
   2. Open the app, click the `DUMP` column below, click the `Scanner` in the plus sign in the upper right corner.
   3. Click the three horizontal line buttons in the upper left corner, and select this phone. 
   4. Select the root directory of the QQ receiving file or the previously copied directory, and click `Allow Access`.
   5. All card data files will be automatically scanned into the `DUMP` file interface, which can be uploaded or edited at will. 
   6. Click the card data file in the `DUMP` column below, and click `Upload` below to upload to the card slot corresponding to the chameleon.

### B2. Introduction to UID mode and SAK mode
---

#### 1. UID Mode

   1.  Enter UID mode:
      - Click the button `UID Changeable (GEN1a)` in the APP or directly send the command `UIDMODE = 1` to turn it on, and `UIDMODE = 0` to turn it `OFF`.
   2. After the UID mode is turned `ON`, the card simulated by Chameleon will become a GEN1a card. 
      - Commonly known as a UID card or Chinese magic card.
   3. Global card slot takes effect.

#### 2. SAK mode

   1. Click the `SAK Mode` button in the APP or directly send the command `SAKMODE = 1` to turn it `ON`, and `SAKMODE = 0` to turn it `OFF`.
   2. After the `SAK Mode` is turned `ON`, the card will feedback the real SAK value when it is found. 
   3. The SAK value is determined by the 0 sector, 0 block, and the position is the position of the sixth byte immediately after the UID number. 
   4. If the SAK mode is not turned on, the SAK is a fixed value of 08, and 0 blocks of data are ignored.
   5. This function is used to meet the situation where some cards with special SAK values cannot be used normally after being copied. This achieve better compatibility.
   6. The current card slot takes effect.

### B3. Card Slot Functions
---

#### 1. UID Card Function Class


|Option     | Type     | Length of UID | Memory Size    |
| ------------------- |:-------------------:| -------------------:| -------------------:|
MF_classic_1K 4B/7B|M1 S50 |4 Byte / 7 Byte|1024 byte
MF_classic_4K 4B/7B | M1 S70|4 Byte / 7 Byte|4096 byte|
MF_classic_mini_4B|M1 mini S20|4 Byte / 7 Byte|320 byte|
MF_ultralight_C|M0 ultralight|7 Byte|192 byte|
MF_ultralight_EV1_80B|M0 ultralight|7 Byte|80 byte|
MF_ultralight_EV1_164B|M0 ultralight|7 Byte|164 byte|
Vicinity|-|8 Byte|8192  byte|
SL2S2002|-|8 Byte|8192 byte|
TITAGITSTANDARD|-|8 Byte|44  byte|
EM4233|-|8 Byte|208 byte|

#### 2. Cracking and Card Reading Functions


|Option     | Ability    | Cracking Type | APP Supported    |
| ------------------- |:-------------------:| -------------------:| -------------------:|
MF_DETECTION_1K|Detecting reader to obtain keys|MFKEY32V2|List results directly|
MF_DETECTION_4K|Detecting reader to obtain keys|MFKEY32V2|List results directly|
ISO14443A_READER|Reader Mode|-|Display UID|
ISO14443A_SNIFF|Sniffing|-|Not supported|
ISO15693_SNIFF|Sniffing|-|Supported|

#### 3. Custom Button Functions


|Option names    | Description    | 
| ------------------- |:-------------------:| 
NONE|Set this button to have no function|
UID_RANDOM|Randomly generated UID number in the current card slot after pressing|
UID_LEFT_INCREMENT|After pressing, the highest byte of the UID number plus one (hexadecimal)|
UID_RIGHT_INCREMENT|After pressing the lowest byte of the UID number plus one (hexadecimal)|
UID_LEFT_DECREMENT|After pressing, the highest byte of the UID number is reduced by one (hexadecimal)
UID_RIGHT_DECREMENT|After pressing, the lowest byte of the UID number is reduced by one (hexadecimal)|
CYCLE_SETTINGS|Card slot number sequence will increase after pressing|
CYCLE_SETTINGS_DEC|Card slot number sequence decreases after pressing|
STORE_MEM|Immediately after pressing, the current card data in the temporary buffer is overwritten into the memory|
RECALL_MEM|Immediately after pressing, the current card data in the memory is overwritten into the temporary buffer (Can be used to quickly restore card data)|
TOGGLE_FIELD|Click once to turn off the antenna and click again to turn on the antenna function|
STORE_LOG|Write the log data in the temporary cache to the memory, which can be saved even when power is off|
CLEAR_LOG|Clear log data immediately after pressing|
CLONE|Read the UID card number immediately after pressing, continue searching, and simulate immediately after reading the card|

## C. Hardware and Basic Use

### C1. All units
---

#### 1. Charging: 
   - Any time you connect USB, it will automatically start charging. 
   - It will stop automatically after filling.
   - The white LED indicates the power level.

#### 2. Detect memory full: 
   - If the memory is full during dense flow detection, multiple red LEDs will be abnormally lit.

#### 3. Charging and Standby Mode

   - Charging method: Plug in the USB at any time and start charging immediately
   - Battery type: LIR2032H replaceable lithium-ion rechargeable battery
   - Charging time: 2 hours @ 0-100%
   - Charging current: 40mA
   - Start-up current: 38mA
   - Card reading current: 65mA
   - Sleep current: 5uA (9uA-MAX)
   - Battery capacity: 70mAh
   - Duration: Swipe the card 3 times a day for 5 seconds each time, and it can be used for one year on a single charge
   - Sleeping time: Fully charged, it can be left for two years when it is turned off and sleeping
   - Port type: 
      - MINI: MicroUSB 
      - TINY: Type-C

### C2. ChameleonMini Rev G
---

#### 1. Turn on Bluetooth and check the battery:
   1. When the power is `OFF`, press any button once to turn on the Bluetooth power, and at the same time, display the current power with a white LED.
   2. With the Bluetooth in the `ON` state, click any button to turn off the Bluetooth power, the power LED goes out, and the system sleeps. 
   3. Bluetooth will sleep automatically after no operation for 15 seconds.
         - Press any button once to shut down immediately.

#### 2. Turn on the chameleon:
   1. With the Bluetooth in the `ON` state, double click any button. Or in the `OFF` state, triple click any button times to turn `ON` the chameleon.
   2. The red LED lights up to indicate the slot number. 
   3. Chameleon will automatically sleep and shut down after no operation for 5 seconds.
  
#### 3. Bootloader/DFU firmware upgrade methods:
   1. With the chameleon in the `OFF` state, press and hold the yellow button near the USB while inserting it into the USB port. The chameleon will enter the `DFU firmware upgrade` mode.
   2. Plug your chameleon in via USB into a PC and use your favorite terminal application to connect to it. Type `upgrade` and hit `Enter`.
   3. Further information from the original: [Here](/../../../../emsec/ChameleonMini/blob/master/Doc/DoxygenPages/GettingStarted.txt)

#### 4. Schematics for ChameleonMini

   - Chameleon Tiny: **[Here](http://chameleontiny.com/downloads/)**

### C3. Chameleon Tiny
---

#### 1. Turn on the chameleon:
   1. With the chameleon in the `OFF` state, press the A button once to turn on the chameleon power.
   2. The red LED lights up to indicate the slot number. 
   3. Chameleon will automatically sleep and shut down after no operation for 5 seconds. This can be adjusted in the Android APP.

#### 2. Bootloader/DFU firmware upgrade methods:
   1. With the chameleon in the `OFF` state, press and hold the B button while inserting it into the USB port.

#### 3. Schematics

   - Same as the Mini

## D. Appendix

### D1. Feature comparison table for each version
---

#### 1. Comparison Table of Specs

|-     | Rev.G Official by KAOS    | Rev.E Old Rdv2.0 by ProxGrind | Rev.G by ProxGrind    |Rev.G  Tiny by ProxGrind |
| ------------------- |:-------------------:| -------------------:| -------------------:|-------------------:
**Simulation**|Good performance, has blind area|Poor compatibility|Perfect performance|no blind area|Perfect performance|no blind area|
**As a reader**|1-2cm for white tag|0cm for keyfob|×|5-6cm for white tag|3-4cm for keyfob|3-5cm for white tag|2-3cm for keyfob|
**Read current**|170mA|×|65mA|60mA|
**BLE nrf52832**|×|×|√|×|
**Li-ion battery**|√|×|√|√|
**Battery indicator**|×|×|√|×|
**Low power sleep**|×|×|√|√|
**RF field wakeup**|×|√|√|√|
**Button wakeup**|×|√|√|√|
**Auto power off**|×|√|√|√|
**Official firmware compatible**|√|√|√|√|
**Replaceable Antenna**|×|×|√|×|
**MFKEY32 crack**|×|√|√|√|
**8 LED for slot**|×|√|√|√|
**Android APP**|×|×|√|√|
**Firmware anti lost**|×|×|√|×|

#### 2. Comparison Table of Analog Card Characteristics
---

||**Rev.G Official By KAOS**|**Rev.E old RDV2.0 By PROXGRIND**|**Rev.G new RDV2.0 By PROXGRIND** |**M1 white tag**|
| ------------------- |:-------------------:| -------------------:| ------------------- |-------------------:|
**122U r/w full data**|1-2 sector only|Smooth|Smooth|Smooth|
**122U Range**|61mm|41mm|73mm|71mm|
**PM3 r/w full data**|1-2 sector only|Smooth|Smooth|Smooth
**PM3 Range**|57mm|74mm|88mm|89mm|
**Phone NFC r/w full data**|No|Smooth|Smooth|Smooth
**Phone NFC Range**|25mm|18mm|33mm|32mm
**Magic back door** |By default|No|Dual mode|No
**SAK ATQA Support**|No|No|Modifiable|No|

#### 3. Comparison Table of New Commands
---

| Command    | Effect Range    | Description | 
| ------------------- |:-------------------:| -------------------:|
**UIDMODE?**|All slot|Returns the configuration of the all slot|
**UIDMODE=?**|All slot|Returns a list of all supported configurations|
**UIDMODE=[0;1]**|All slot|Activates(1)，deactivates(0)，the magic card mode(It will has Chinese magic card back door)|
**SAKMODE?**|Current slot|Returns the configuration of the current slot|
**SAKMODE=?**|Current slot|Returns a list of all supported configurations|
**SAKMODE=[0;1]**|Current slot|Activates(1)，deactivates(0)，the real SAK ATQA mode (the SAK ATQA will be mapped from block 0)|
**CONFIG=MF_DETECTION_1K**|Current slot|Set current slot to detection 1K mode.|(It will record the key information as log in flash)|
**CONFIG=MF_DETECTION_****4****K**|Current slot|Set current slot to detection 4K mode.|(It will record the key information as log in flash)|
**DETECTION=0**|Device|Clears the detection log memory|
**DETECTION？**|Device|Wait for an XModem connection and then downloads the binary detection log data.|

### D2. Complete Instruction List
---

#### 1. From EMSEC:
   - [Here](/../../../../emsec/ChameleonMini/master/Doc/Doxygen/html/_page__command_line.html)
   
#### 2. This repo
   - [Instruction sheet](/../../../../RfidResearchGroup/ChameleonMini/blob/proxgrind/Doc/DoxygenPages/CommandLine.txt)

### D5. Supported Cards, Encoding, & Simulation Types
---

#### 1. From EMSEC:
   - [Here](/../../../../emsec/ChameleonMini/wiki/Supported-Cards-and--Codecs)

#### 2. Comparison Table of Encoding/Simulation Types

|Card Type|Encoding Type|Whether the hardware supports|Does the software support|Whether the application layer supports|Note|
| ------------------- |:-------------------:| -------------------:| ------------------- |:-------------------:| -------------------:|
Non13.56MHz|No|No|No| |
Mifare Ultralight|ISO14443A/106 kbit/s|Support|Support|Support|
Mifare Ultralight Ev1|ISO14443A/106 kbit/s|Support|Support|Support|
MifareClassic1K/4K 4B/7B|ISO14443A/106 kbit/s|Support|Support|Support|
Mifare DESFire|ISO14443A High Rate|Supports low rates, or possibly higher rates|Only supported Low rate|No|
Mifare DESFire EV1|ISO14443A High rate|Supports low rates, or possibly higher rates|Only supported Low rate|No|Backward compatible|
Mifare DESFire EV2|ISO14443A High rate| Supports low rates, or possibly higher rates|Only supported|Low rate|No|Backward compatible|
Mifare PLUS|ISO14443A High rate|Supports low rates, or possibly higher rates|Only supported Low rate|No
Sniff Mode NTAG|ISO14443A 106 kbit/s|Support|Support| No
LEGIC prime|LEGICprime/ ISO14443A/ ISO15693|Possible but not supported|Possible but not supported|No|
HID iCLASS|125kHz/ISO15693/ISO14443B|Possible but not supported|Possible but not supported|No|
Epass|ISO14443A/B|Supported / Supported|Low rate only / not supported|No|
TiTagIT Standard|ISO15693|Support|Support|Support|
EM4233|ISO15693|Support|Support|Support|

#### 3. Comparison Table of Sniff Modes

|Encoding type|Whether the hardware supports|Does the software support| Whether the application layer supports|Note|
| ------------------- |:-------------------:| -------------------:| ------------------- |-------------------:|
Non-13.56MHz|Not Supported|Not Supported|Not Supported|
ISO 14443 A 106 kbit/s|Reader -> card Direction sniffing|Maybe support the other direction|Currently only supported Reader -> card Direction sniffing ||
ISO 15693|Support|Support|Support|Single subcarrier only|

 #### 4. Comparison Table of Supported Reading Card Types

Card type |Encoding type|  Whether the hardware stand by|Whether the software stand by|Whether the application layer supports|Note
| ------------------- |:-------------------:| -------------------:| ------------------- |-------------------:|-------------------:|
Non13.56MHz|Not Supported|Not Supported|Not Supported|
Mifare Ultralight|ISO14443A 106 kbit/s|Support|Support|SupportCommand: dump_mfu
MifareClassic1K/4K 4B/7B|ISO14443A 106 kbit/s|Support|Support|Not Supported|No card reading instruction, encryption function has been implemented|MIFARE DESFIRE|ISO14443A High rate|Supports low rates, or possibly higher rates|  Only supported Low rate|Not Supported|No card reading instruction, encryption function is being supported|

### D5. Usage Guide for new functions
---

<a href="https://ibb.co/VvcGbg9"><img src="https://i.ibb.co/K9pgB2h/EUd-Gl7w-Uw-AAg-Cf6.jpg" alt="EUd-Gl7w-Uw-AAg-Cf6" border="0"></a><br />

## E. External Contributions
---

- Iceman
- Philippe Teuwen
- Willok
- DXL
- ProxGrind aka Olaf
