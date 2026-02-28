;APEX 1.8.8
;EVO
;NOZZLE: PRIMARY
;SIZE: 0.8mm
;MATERIAL: ABS
;QUALITY: PRECISE
;LAYER HEIGHT: 0.22mm
;WALLS: 1mm
;FILL: 29%
;PRINT SPEED: ?print_STANDARD?mm/s
;PRINT TEMPERATURE: 238C
;INITIAL BED TEMPERATURE: 124C
;SIZE: SMALL
;PRINT TIME: 23 minutes
;FILAMENT USED: 7.0g
;DATE: 01-26-2026

;START CODE
M502                 ;Reset
M601 S255            ;Lights on
M106 P2 S5           ;Center STANDARD low for quick nozzle heating
M106 S0              ;Side fans off
;Special Bed Prep Off

;M104 T0 S238         Set nozzle 1 to temp
;M104 T1 S0           Set nozzle 2 to temp
;M140 S124            Set bed to temp
;M141 S0              Chamber Heaters Off

T0                           ; First nozzle
G21                          ; Metric values
G90                          ; Absolute positioning
M82                          ; Set extruder to absolute mode
M107                         ; Start with the fan off
G92 E0                       ; Set extruder to 0
G28                          ; Home all
G0 Z0  F1200                 ; Bring up Z

;M109 T0 S238            Hold until nozzle 1 at temp
;M109 T1 S0              Hold until nozzle 2 at temp
;M190 S124               Hold until bed at temp

M106 P2 S175            ; Turn center fan back on (STANDARD depends on filament)
M204 S2000              ; Set acceleration for auto-level sequence
G0 Z3 F900              ; Raise hot end above bed rails

T0                      ; Nozzle 1
;G1 E-15 F100             Retract filament 15mm to minimize auto-level error

G0 X0 Y350 F15000       ; Quickly move to left of brush
G0 Z0 F900              ; Lower to brush

;LEFT-RIGHT
G0 X25 Y350 F2000       ; Slowly move right across brush in zig zag
G0 X38 Y342 Z-1         ; Slowly move right across brush in zig zag
G0 X51 Y350 Z0          ; Slowly move right across brush in zig zag
G0 X64 Y342 Z-1         ; Slowly move right across brush in zig zag
G0 X77 Y350 Z0          ; Slowly move right across brush in zig zag
G0 X90 Y342 Z-1         ; Slowly move right across brush in zig zag
G0 X105 Y350 Z0         ; Slowly move right across brush in zig zag
G0 X120 Y342 Z-1        ; Slowly move right across brush in zig zag
G0 X120 Y350  Z0        ; Slowly move to the right of the brush

;RIGHT-LEFT
G0 X85 Y350 Z-1 F2000   ; Slowly move left across brush
G0 X25 Y350 Z0          ; Slowly move left across brush

;LEFT-RIGHT
G0 X38 Y342 Z-1         ; Slowly move right across brush in zig zag
G0 X51 Y350 Z0          ; Slowly move right across brush in zig zag
G0 X64 Y342 Z-1         ; Slowly move right across brush in zig zag
G0 X77 Y350 Z0          ; Slowly move right across brush in zig zag
G0 X90 Y342 Z-1         ; Slowly move right across brush in zig zag
G0 X105 Y350 Z0         ; Slowly move right across brush in zig zag
G0 X120 Y342 Z-1        ; Slowly move right across brush in zig zag
G0 X120 Y350  Z0        ; Slowly move to the right of the brush
;G1 E-20 F125            Retract more filament

;RIGHT-LEFT
G0 X85 Y350 Z-1 F2000   ; Slowly move left across brush
G0 X25 Y350 Z0          ; Slowly move left across brush

G29                     ; Auto-level
G91                     ; Relative positioning
G0 Z3 F900              ; Lift nozzle 1mm  G0 Z+ NOT recognized by GENESIS board - must use G0 Z1,2, etc. in relative mode
G90                     ; Absolute positioning
G0 X143 Y300 F15000     ; Move right across bed quickly
G0 X143 Y350 F15000     ; Move above dump tank quickly
G0 Z-2 F900             ; Lower nozzle to -2mm

T0                      ; Nozzle 1
G92 E0                  ; Clear filament counter
;G1 E24 F100              Prime filament 1 into dump tank
G92 E0                  ; Clear filament counter

G0 X220 Y350 F15000         ; Move right quickly to remove filament
G0 Z0.5 F900                ; Raise nozzle to .5mm over bed
G0 X220 Y300 F15000         ; Move to rear of bed quickly

M201 X1200 Y1200 Z100 E1000  ; Set acceleration
M906 X12 Y12 Z14          ; Set stepper current
M92 X100.5 Y100.5   ; Shrinkage compensation
M400


M104 T0 S0         ; Set nozzle 1 to temp

;end start code start drying code

G0 Z280 F1200                 ; Bring up Z
