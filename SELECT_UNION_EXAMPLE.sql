SELECT power_horse, prod_year, model FROM cars
union
SELECT id_plate, brand, model from cars group by brand;