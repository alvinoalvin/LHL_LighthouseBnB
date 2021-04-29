SELECT properties.id, title, start_date, cost_per_night, avg(rating) as average_ratings
from properties
  join reservations on properties.id = reservations.property_id
  join property_reviews on properties.id = property_reviews.property_id
where reservations.guest_id = 1 and end_date < now()
group by properties.id, reservations.start_date
order by start_date
limit 10;