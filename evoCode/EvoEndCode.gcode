M400
G28                             ; home all
M104 T0 S0                      ; switch off first nozzle
M104 T1 S0                      ; switch off second nozzle
M140 S0                         ; heated bed heater off
M141 S0                         ; chamber heaters off
M107                            ; fans off
T0
G92 E0                          ; set first extruder to 0
;G1 E-3 F300                      retract a bit to relieve pressure
T1
G92 E0                          ; set second extruder to 0
;G1 E-3 F300                      retract a bit to relieve pressure
T0								; switch back to extruder 1
M84                             ; steppers off
G90                             ; absolute positioning
;{cool_code}
;LIGHT SEQUENCE
M601 S0
G4 P500
M601 S255
G4 P500
M601 S0
G4 P1500
M601 S255
G4 P1500
M601 S0
G4 P500
M601 S255
G4 P500
M601 S0
G4 P1500
M601 S255
G4 P1500
M601 S0
G4 P500
M601 S255
G4 P500
M601 S0
G4 P500
M601 S255
G4 P500
M601 S0                         ;Turn lights off
