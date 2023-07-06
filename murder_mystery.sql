-- Filtering down with the information from the crime_scene_report
SELECT *
FROM crime_scene_report
where city == 'SQL City' and type == 'murder' and date == 20180115

-- Joining tables and also filtering to get the full details of the witnesses
SELECT   person_id, name, gender, address_street_name
from crime_scene_report
INNER JOIN facebook_event_checkin
ON crime_scene_report.date = facebook_event_checkin.date
INNER JOIN person
ON facebook_event_checkin.person_id = person.id
INNER JOIN drivers_license
on person.license_id == drivers_license.id
WHERE city == 'SQL City' and type == 'murder' and date == 20180115

-- Filtering to get the statement of the witnesses during their interview
SELECT *
FROM interview
where person_id == 14887 or person_id = 16371

-- Joining tables and also filtering with the like operator to return precise record sets based on specific values
SELECT get_fit_now_check_in.membership_id, get_fit_now_check_in.check_in_date, drivers_license.plate_number, person.name, drivers_license.gender, 
get_fit_now_member.membership_status, drivers_license.age, drivers_license.height, drivers_license.eye_color, drivers_license.hair_color
FROM get_fit_now_check_in
INNER JOIN get_fit_now_member
ON get_fit_now_check_in.membership_id = get_fit_now_member.id
INNER JOIN person
ON get_fit_now_member.name = person.name
INNER JOIN drivers_license
on person.license_id = drivers_license.id
WHERE membership_status == 'gold' and check_in_date == 20180109 and membership_id LIKE '%48Z%' and plate_number like '%H42W%'