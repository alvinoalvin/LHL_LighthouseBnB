-- select properties.id as id, properties.title as title, properties.cost_per_night as cost_per_night, avg(property_reviews.rating) average_rating
-- from properties
--   join property_reviews on property_reviews.property_id = properties.id
-- where city = 'vancouver' and rating >= 4
-- group by city
-- order by cost_per_night
-- limit 10;

SELECT properties.*, avg(property_reviews.rating) as average_rating
FROM properties
  JOIN property_reviews ON properties.id = property_id
WHERE city LIKE '%ancouv%'
GROUP BY properties.id
HAVING avg(property_reviews.rating) >= 4
ORDER BY cost_per_night
LIMIT 10;
