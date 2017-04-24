# This file list all devices that are supported.

| Device Type                        | Device Model                     | Instruction Set (main SoC)   | CE  | Debug   | CC   | 
| ---------------------------------- | -------------------------------- | ---------------------------- | --- | ------- | ---- | 
| [HDD1](ssd-crucial-mx100/)         | Crucial MX100 SSD                | ARM                          | ✔   | ✔       | ✔    | 
| HDD2                               | Western Digital 20GB             | ARM                          | ✔   | ✘       | ✔    | 
| HDD3                               | Seagate                          | ARM                          | ✔   | ✘       | ✔    | 
| [METER1](meter-schneider-ion8600/) | Schneider ION8600                | ARM                          | ✔   | ✘       | ✘    | 
| METER2                             | Iskramenco ME372                 | ARM                          | ✔   | ✔       | ✔    | 
| METER3                             | PG&E                             | MSP432                       | ✔   | ✔       | ✘    | 
| [PLC1](control-logix-l61)          | ControlLogix 1756-L61            | ARM                          | ✔   | ✔       | ✘    | 
| [PLC2](plc-siemens-s7-1200/)       | SIMATIC S7-1200, CPU 1212C       | ARMbe                        | ✔   | ✘       | ✘    | 
| PLC3                               | MicroLogix 1100                  | MCF5282                      | ✘   | ✔       | ✘    | 
| PRINT1                             | Dell 1130n                       | ARMbe                        | ✔   | ✘       | ✘    | 
| PRINT2                             | HP-LaserJet, P2055DN             | ARM                          | ✔   | ✘       | ✘    | 
| PRINT3                             | SamsungML-2160                   | ARM                          | ✔   | ✔       | ✘    | 
| NIC1                               | 5755M Broadcom NetXtreme         | RX RISC                      | ✔   | ✘       | ✘    | 
| NIC2                               | Netgear GA620 Network Card       | MIPS                         | ✔   | ✘       | ✘    | 
| KEY1                               | Apple Keyboard MB110LL/A         | CY7C63923                    | ✔   | ✘       | ✘    | 
| MOUS1                              | Logitech G600 MMO Gaming Mouse   | AVR                          | ✔   | ✘       | ✘    | 
| CAM1                               | 3S Vision N5072                  | ARM                          | ✔   | ✘       | ✘    | 
| [CAM2](cam-apple-webcam/)          | iSight Apple Webcam              | CY7C68013A                   | ✔   | ✘       | ✘    | 

---

 * `✔`      discovered
 * `✘`      not discovered
 * `❓`      unknown

---


 * `CE`     code execution
 * `Debug`  debug interface
 * `CC`     communication channel

---

 * `SSD`    solid state drive
 * `HDD`    hard disk drive
 * `METER`  (smart)metering device
 * `PLC`    programmable logic controller
