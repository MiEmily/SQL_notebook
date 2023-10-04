-- #others simple 
SELECT Request_at AS Day, ROUND(SUM(IF(Status = 'completed', 0, 1))/COUNT(Status), 2) AS 'Cancellation Rate' 
FROM Trips 
WHERE Client_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = 'Yes') 
    AND Driver_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = 'Yes')
    AND Request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY Request_at;
-- #mine complicated one lol


with nonban as(
select * from trips
where client_id not in  (select users_id from users where banned='yes') 
and driver_id not in  (select users_id from users where banned='yes'))

select request_at 'Day', round(sum(status like '%cancelled%')/count(status),2 ) 'cancellation rate'
from nonban
where request_at between  "2013-10-01" and "2013-10-03"
group by request_at

-- #in where clause,it process before , so the alias defined in select clause not avaliable yet.
