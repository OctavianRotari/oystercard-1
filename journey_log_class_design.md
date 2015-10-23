JourneyLog class design
=======================
<br><br>
- Oystercard should touch in
  - JourneyLog should start a new Journey
    - Journey should store the entry station
<br><br>
- Oystercard should deduct a penalty fare on 2 sequential #touch_ins
  - JourneyLog should store the first part complete journey
  - JourneyLog should return the penalty fare
    - Journey should calculate and return the fare
  - JourneyLog should start a new Journey
    - Journey should store the entry station
<br><br>
- Oystercard should deduct a fare on #touch_out
  - JourneyLog should store the completed trip
    - Journey should store the exit station
  - JourneyLog should set the Journey to nil
  - JourneyLog should return the fare
    - Journey should calculate and return the fare
