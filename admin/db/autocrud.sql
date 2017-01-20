create database autocrud;

use autocrud;

create table list(
	list_id int auto_increment not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	description varchar(200) null,
	isactive char(1) not null default 'Y',
	constraint pk_list_id primary key (list_id)
)engine = InnoDB;

create table value(
	value_id int auto_increment not null,
	list_id int not null,
	parent_value_id int null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	default_value text,
	optional_value1 text,
	optional_value2 text,
	optional_value3 text,
	optional_value4 text,
	optional_value5 text,
	isactive char(1) not null default 'Y',
	constraint pk_value_id primary key (value_id),
	constraint fk_list_id foreign key (list_id) references list (list_id) on update cascade on delete restrict
)engine = InnoDB;

create table window(
	window_id int auto_increment not null,
	window_type_id int not null,
	tablename varchar(150) not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	description varchar(200) null,
	isactive char(1) not null default 'Y',
	constraint pk_window_id primary key (window_id),
	constraint fk_window_type_id foreign key (window_type_id) references value (value_id) on update cascade on delete restrict
)engine = InnoDB;

create table field(
	field_id int auto_increment not null,
	columname varchar(150) not null,
	field_type_id int not null,
	isstatic char(1) not null default 'Y',
	static_list_id int null,
	dinamic_query_id int null,
	parent_field_id int null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	description  varchar(200) null,
	json_validation text,
	ingrid char(1) not null default 'Y',
	conditions text,
	isactive char(1) not null default 'Y',
	constraint pk_field_id primary key (field_id),
	constraint fk_field_type_id foreign key (field_type_id) references value (value_id) on update cascade on delete restrict
)engine = InnoDB;

create table element(
	element_id int auto_increment not null,
	element_type_id int not null,
	window_id int not null,
	identified int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	position int not null default 1,
	isactive char(1) not null default 'Y',
	constraint pk_element_id primary key (element_id),
	constraint fk_element_type_id foreign key (element_type_id) references value (value_id) on update cascade on delete restrict,
	constraint fk_window_id foreign key (window_id) references window (window_id) on update cascade on delete restrict
)engine=InnoDB;

create table item(
	item_id int auto_increment not null,
	item_type_id int not null,
	window_id int null,
	parent_item_id int null,
	menu_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	description varchar(200) null,
	isinternal char(1) not null default 'Y',
	url varchar(100) null,
	content text,
	position int not null default 1,
	isactive char(1) not null default 'Y',
	constraint pk_item_id primary key (item_id),
	constraint fk_item_type_id foreign key (item_type_id) references value (value_id) on update cascade on delete restrict,
	constraint fk_menu_id foreign key (menu_id) references value (value_id) on update cascade on delete restrict
)engine = InnoDB;

create table user(
	user_id int auto_increment not null,
	role_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	first_name varchar(60) not null,
	last_name varchar(60) null,
	sex char(1) not null,
	birthday date not null,
	email varchar(150) not null,
	phone varchar(20) null,
	username varchar(30) not null,
	avatar varchar(100) null,
	isactive char(1) not null default 'Y',
	constraint pk_user_id primary key (user_id),
	constraint fk_role_id foreign key (role_id) references value (value_id) on update cascade on delete restrict
)engine = InnoDB;

create table access(
	access_id int auto_increment not null,
	item_id int not  null,
	role_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	isative char(1) not null default 'Y',
	constraint pk_access_id primary key (access_id),
	constraint fk_item_id foreign key (item_id) references value (value_id) on update cascade on delete restrict,
	constraint fk_role_id01 foreign key (role_id) references value (value_id) on update cascade on delete restrict
)engine = InnoDB;

create table password(
	password_id int auto_increment not null,
	user_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	strpassword varchar(100) not null,
	isactive char(1) not null default 'Y',
	constraint pk_password_id primary key (password_id),
	constraint fk_user_id foreign key (user_id) references user (user_id) on update cascade on delete restrict
)engine = InnoDB;

create table question(
	question_id int auto_increment not null,
	user_id int not  null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	strquestion varchar(200) not null,
	stranswer varchar(200) not null,
	isactive char(1) not null default 'Y',
	constraint pk_question_id primary key (question_id),
	constraint fk_user_id001 foreign key (user_id) references user (user_id) on update cascade on delete restrict
)engine = InnoDB;

create table post(
	post_id int auto_increment not null,
	user_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	title varchar(100) not null,
	content text,
	tags varchar(200) null,
	status char(1) not null default 'P',
	isactive char(1) not null default 'Y',
	constraint pk_post_id primary key (post_id),
	constraint fk_user_id002 foreign key (user_id) references user (user_id) on update cascade on delete restrict
)engine=InnoDB;

#LIST
insert into list(list_id,name) values (1,"ROLES");
insert into list(list_id,name) values (2,"WINDOWS TYPE");
insert into list(list_id,name) values (3,"FIELDS TYPE");
insert into list(list_id,name) values (4,"PRIVATE MENU");
insert into list(list_id,name) values (5,"PUBLIC MENU");
insert into list(list_id,name) values (6,"ITEM TYPE");
insert into list(list_id,name) values (7,"ELEMENT TYPE");

#VALUE
insert into value (value_id,list_id,default_value) values (1,1,"SYSTEM");
insert into value (value_id,list_id,default_value) values (2,1,"ADMIN");
#WINDOW TYPE
insert into value (value_id,list_id,default_value) values (3,2,"MASTER FORM");
insert into value (value_id,list_id,default_value) values (4,2,"DETAIL FORM");
#FIELD TYPE
insert into value (value_id,list_id,default_value) values (5,3,"TEXT");
insert into value (value_id,list_id,default_value) values (6,3,"SELECT");
insert into value (value_id,list_id,default_value) values (7,3,"RADIO");
insert into value (value_id,list_id,default_value) values (8,3,"CHECKBOX");
insert into value (value_id,list_id,default_value) values (9,3,"TEXTAREA");
insert into value (value_id,list_id,default_value) values (10,3,"DATE");
insert into value (value_id,list_id,default_value) values (11,3,"AUTO-COMPLETE");
insert into value (value_id,list_id,default_value) values (12,3,"DATE-TIME");
#PRIVATE LIST
insert into value (value_id,list_id,default_value) values (13,5,"GENERAL");
#ITEM TYPE
insert into value (value_id,list_id,default_value) values (14,6,"FOLDER");
insert into value (value_id,list_id,default_value) values (15,6,"WINDOW");
insert into value (value_id,list_id,default_value) values (16,6,"REPORT");
insert into value (value_id,list_id,default_value) values (17,6,"CHART");
#ELEMENT TYPE
insert into value (value_id,list_id,default_value) values (18,7,"FIELD");
insert into value (value_id,list_id,default_value) values (19,7,"DETAIL FORM");

#USER
insert into user (user_id, role_id, first_name,last_name,sex,birthday,email,phone,username)
	values (1,1,"SYSTEM NAME","SYSTEM LAST NAME",'M',"1991-01-09","systememail@domain.com","+580000000000","SYSTEM");

#PASSWORD
insert into password (password_id,user_id,strpassword) values (1,1,MD5("4ut0crud"));

#QUESTION
insert into question(question_id,user_id,strquestion,stranswer) values (1,1,"auto","crud");
insert into question(question_id,user_id,strquestion,stranswer)values (2,1,"crud","auto");

#WINDOWS
insert into window (window_id,window_type_id,tablename,name) values (1,3,"list","LIST");

 #FIELD
insert into field (field_id,columname,field_type_id,isstatic,name) values (1,"list_id",6,"Y","LIST ID");
insert into field (field_id,columname,field_type_id,isstatic,name) values (2,"created",12,"Y","CREATED");
insert into field (field_id,columname,field_type_id,isstatic,name) values (3,"updated",12,"Y","UPDATED");
insert into field (field_id,columname,field_type_id,isstatic,name) values (4,"name",5,"Y","NAME");
insert into field (field_id,columname,field_type_id,isstatic,name) values (5,"description",9,"Y","DESCRIPTION");
insert into field (field_id,columname,field_type_id,isstatic,name) values (6,"isactive",9,"Y","ISACTIVE");

#ELEMENT
insert into element (element_id,element_type_id,window_id,identified,position) values (1,18,1,1,1);
insert into element (element_id,element_type_id,window_id,identified,position) values (2,18,1,2,2);
insert into element (element_id,element_type_id,window_id,identified,position) values (3,18,1,3,3);
insert into element (element_id,element_type_id,window_id,identified,position) values (4,18,1,4,4);
insert into element (element_id,element_type_id,window_id,identified,position) values (5,18,1,5,5);
insert into element (element_id,element_type_id,window_id,identified,position) values (6,18,1,6,6);

#ITEM
insert into item (item_id,item_type_id,window_id,menu_id,name,position) values (1,15,1,13,"LIST",1);

#ACCESS
insert into access (access_id,item_id,role_id) values (1,1,1);