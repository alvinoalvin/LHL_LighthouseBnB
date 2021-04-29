select city, count(reservations) total_reservations
from reservations
  join properties on properties.id = reservations.property_id
group by properties.city
ORDER BY total_reservations DESC;