DELETE FROM users;
DELETE FROM properties;
DELETE FROM reservations;
DELETE FROM property_reviews;

INSERT INTO users VALUES(1,'name1','email1@gmail.com','$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u');
INSERT INTO users VALUES(2,'name2','email2@gmail.com','$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u');
INSERT INTO users VALUES(3,'name3','email3@gmail.com','$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u');
INSERT INTO properties VALUES(1,1,'title1','description1','thumbnail_photo_url1','cover_photo_url1',2,3,3,1,'USA','BLACKHOMB STREET','VANCOUVER','BC','V9AS9A',TRUE);
INSERT INTO properties VALUES(2,2,'title2','description2','thumbnail_photo_url2','cover_photo_url2',2,3,3,1,'USA','BLACKHOMB STREET','VANCOUVER','BC','V9AS9A',TRUE);
INSERT INTO properties VALUES(3,3,'title3','description3','thumbnail_photo_url3','cover_photo_url3',2,3,3,1,'USA','BLACKHOMB STREET','VANCOUVER','BC','V9AS9A',TRUE);
INSERT INTO reservations VALUES(1,'2020-02-1','02/03/2021',1,1);
INSERT INTO reservations VALUES(2,'2020-02-2','02/03/2021',2,2);
INSERT INTO reservations VALUES(3,'2020-02-3','02/03/2021',3,3);
INSERT INTO property_reviews VALUES(1,1,1,1,5,'VERY NICE INDEED');
INSERT INTO property_reviews VALUES(2,2,2,2,5,'VERY NICE INDEED');
INSERT INTO property_reviews VALUES(3,3,3,3,5,'VERY NICE INDEED');
