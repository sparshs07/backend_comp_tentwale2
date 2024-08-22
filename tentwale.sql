CREATE DATABASE tentwaledb2;

USE tentwaledb2;

-- #######MEMBERSHIP#########

CREATE TABLE membership
(
    membership_id int auto_increment Primary Key,
    name char(10) not null
);
insert into membership (membership_id,name) values (1,'Silver'),(2,'Gold'),(3,'Platinum');
-- #######MEMBERSHIP#########


-- #######ITEM_TYPES#########
CREATE TABLE item_types
(
    item_type_id int auto_increment Primary Key,
    name char(30) not null
);
insert into item_types (item_type_id,name) values (1,'Spoon'),(2,'Plates'),(3,'Utensils'),(4,'Chair'),(5,'Pipes')
,(6,'Curtains'),(7,'Lights'),(8,'Beddings'),(9,'Appliances'),(10,'Others');
-- #######ITEM_TYPES#########
-- #######ITEMS#########

CREATE TABLE items
(
    item_id int auto_increment Primary Key,
    name char(30) not null,
    description char(255),
    item_type_id int not null,
    item_pic char(255),
    constraint fk_items_itemtype foreign key (item_type_id) references item_types (item_type_id)
);

INSERT into items (item_id,name,description,item_type_id) values
(1,'Wooden Spoon','A spoon which is easy to decompose,used only once',1),
(2,'Steel Spoon','A general purpose spoon,can be used multiple times',1),
(3,'Steel Spatula','It is used in cooking,having flat head',1),
(4,'Steel Laddle','It is used in cooking,having round head',1),
(5,'Plastic Plate','General purpose plastic plate with high grade and scratchless plastic',2),
(6,'Steel Plate','General purpose steel plate with stainless and scratchless steel',2),
(7,'Glass Plate','General purpose glass plate with high grade and scratchless glass',2),
(8,'Ganje Small(10L)','Used to cook small amount of food items',3),
(9,'Ganje Medium(100L)','Used to cook mid amount of food items',3),
(10,'Ganje Large(200L)','Used to cook large amount of food items',3),
(11,'Kadhai Small(10L)','Used to cook small amount of food items',3),
(12,'Kadhai Medium(100L)','Used to cook medium amount of food items',3),
(13,'Kadhai Large(200L)','Used to cook large amount of food items',3),
(14,'Small Pan','Used to cook large amount of food items',3),
(15,'Large Pan','Used to cook large amount of food items',3),
(16,'Plastic Chair','General purpose chair used for sitting',4),
(17,'Wooden Chair','General purpose chair used for sitting',4),
(18,'Steel Chair','General purpose chair used for sitting',4),
(19,'Wedding Chair','Chair used for bride/groom',4),
(20,'Sofas','General purpose sofas used for sitting',4),
(21,'Couch','General purpose couch used for sitting',4),
(22,'Steel Pipes(30ft)','Used to put curtains upon it',5),
(23,'Steel Pipes(50ft)','Used to put curtains upon it',5),
(24,'Ceiling Curtain','Curtains to put upon ceiling',6),
(25,'SideWall Curtain','Curtains to put in sidewalls',6),
(26,'Table curtains','Curtains to put upon tables',6),
(27,'Shade Curtains','Used to put curtains upon it',6),
(28,'Focus Lights','High Beam Light to focus object',7),
(29,'Jhoomar Lights','Lights used as in Jhoomars',7),
(30,'DJ Lights','Lights used in DJ,s',7),
(31,'Mercury Lights','Lights used in DJ,s',7),
(32,'Pillow','General Pillow',8),
(33,'Foam Mattress','Mattress made out of hard foam',8),
(34,'Cushion Mattress','Mattress made out of soft foam',8),
(35,'Spring Mattress','Mattress made up of soft foam and spring',8),
(36,'Thin Blanket','General purspose thin blanket',8),
(37,'Thick Blanket','General purspose thick blanket',8),
(38,'Foldable Bed','General purpose bed which can be folded used where space is less',8),
(39,'Fixed Bed','Bed is fixed and used where there is ample amount of space',8),
(40,'Mattress Cover','It is cover to the mattress',8),
(41,'Ceiling Fan','Fan to put upon ceiling',9),
(42,'Table Fan','Fan to put upon table',9),
(43,'Standing Fan','Modifiend version of table fan but having adjustable height',9),
(44,'Cooler','General purpose cooler',9),
(45,'Water Blower','It blows out sprinkels of water',9),
(46,'Coffee Machine','It is used to make coffee',9),
(47,'Tea Machine','It is used to make tea',9),
(48,'Steel Foldable Table(Small)','General puspose table for small functions',10),
(49,'Steel Foldable Table(Large)','General puspose table for massive functions',10),
(50,'Serving Container(5L)','It is used to serve and display cooked food items',10),
(51,'Serving Container(10L)','It is used to serve and display cooked food items',10),
(52,'Jug','General purpose Jug',10),
(53,'Steel Bucket(10L)','It is used to make tea',10),
(54,'Steel Bucket(20L)','It is used to make tea',10),
(55,'Carpet','High Quality Flooring',10);



-- #######ITEMS#########

-- #######PINCODE#########

CREATE TABLE pincode
(
    pincode_id int auto_increment Primary Key,
    pin int null 
);
-- #######PINCODE#########

-- #######STATUS#########

CREATE TABLE status
(
    status_id int auto_increment Primary Key,
    name char(15) not null
);
insert into status (status_id,name) values (1,'Active'),(2,'Deactive'),(3,'Blocked'),(4,'Closed');

-- #######STATUS#########



-- #######USERS#########

CREATE TABLE users
(
    user_id int auto_increment primary key,
    name char(45) not null,
    email char(60) not null unique,
    password char(255),
    pic char(45),
    phone char(10) not null,
    otp char(6) not null,
    trust_points int not null default 10,
    user_type boolean not null,
    membership_id int not null default 1,
    status_id int not null default 1,
    pincode_id int not null,
    
    constraint fk_users_membership foreign key (membership_id) references membership (membership_id),
    constraint fk_users_status foreign key (status_id) references status (status_id),
    constraint fk_users_pincode foreign key (pincode_id) references pincode(pincode_id) 
);
alter table users alter user_type set default false;
alter table users modify pincode_id int NULL;
alter table users alter status_id set default 1;
alter table users add column address char(100) NULL;
alter table users add column tentwala_name char(100) NULL;
-- #######USERS#########

-- #######WISHLIST#########

CREATE TABLE wishlist
(
    wishlist_id int auto_increment primary key,
    user_id int not null,
    user_tentwale_id int not null,

    constraint fk_wishlist_users1 foreign key (user_id) references users(user_id),
    constraint fk_wishlist_users2 foreign key (user_tentwale_id) references users(user_id)
);
-- #######WISHLIST#########

-- #######TENTWALA_ITEMS#########

CREATE TABLE tentwala_items
(
    tentwala_item_id int auto_increment primary key,
    item_id int not null,
    total_quantity int not null,
    unit_price int not null,
    user_tentwale_id int not null,

    constraint fk_tentwalaitems_items foreign key (item_id) references items(item_id),
    constraint fk_tentwala_items_user2 foreign key(user_tentwale_id) references users(user_id) 
);
alter table tentwala_items add column tentwala_item_pic char(255) null;
-- #######TENTWALA_ITEMS#########

-- #######INVOICE#########

CREATE TABLE invoice
(
    invoice_id int auto_increment primary key,
    user_id int not null,
    user_tentwale_id int not null,
    booked_on datetime  null default CURRENT_TIMESTAMP,
    booked_days int null default 0,

    constraint fk_invoice_users1 foreign key (user_id) references users(user_id),
    constraint fk_invoice_users2 foreign key (user_tentwale_id) references users(user_id)

);
    alter table invoice add column booked_to datetime  null default CURRENT_TIMESTAMP;
    alter table invoice add column delivery_email varchar(50)  null default 'test@gmail.com';
    alter table invoice add column delivery_address varchar(100)  null default 'sbi colony';
    alter table invoice add column delivery_phone varchar(20)  null default '9999999999';
    -- #######INVOICE#########


-- #######INVOICE_ITEMS#########

CREATE TABLE invoice_items
(
    invoice_item_id int auto_increment primary key,
    invoice_id int not null,
    tentwala_item_id int not null,
    constraint fk_invoiceitems_invoice foreign key (invoice_id) references invoice (invoice_id),
    constraint fk_invoiceitems_items foreign key (tentwala_item_id) references tentwala_items(tentwala_item_id)
);


alter table invoice_items add column booked_quantity int null default 0;
-- #######INVOICE_ITEMS#########
