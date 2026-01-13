class Weekdays < EnumerateIt::Base
  associate_values(
    sunday: 1,
    monday: 2,
    thursday: 3,
    wednesday: 4,
    tuesday: 5,
    friday: 6,
    saturday: 7 
  )
end
