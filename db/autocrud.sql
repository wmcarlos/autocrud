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
	parent_value_id int not null,
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
	constraint fk_list_id foreign key (list_id) references list (list_id) on update cascade on delete restrict,
	constraint fk_parent_value_id foreign key (parent_value_id) references value (value_id) on update cascade on delete restrict
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
	constraint fk_field_type_id foreign key (field_type_id) references value (value_id) on update cascade on delete restrict,
	constraint fk_static_list_id foreign key (static_list_id) references value (value_id) on update cascade on delete restrict,
	constraint fk_dinamic_query_id foreign key (dinamic_query_id) references value (value_id) on update cascade on delete restrict,
	constraint fk_parent_field_id foreign key (parent_field_id) references field (field_id) on update cascade on delete restrict
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
	window_id int not null,
	parent_item_id int not null,
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
	constraint fk_window_id001 foreign key (window_id) references window (window_id) on update cascade on delete restrict,
	constraint fk_parent_item_id foreign key (parent_item_id) references item (item_id) on update cascade on delete restrict
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
	isative char(1) not null default 'Y',
	constraint pk_password_id primary key (password_id),
	constraint fk_user_id foreign key (user_id) references user (user_id) on update cascade on delete restrict
)engine = InnoDB;

create table question(
	question_id int auto_increment not null,
	user_id int not  null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	strquestion varchar(200) not null,
	straswer varchar(200) not null,
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
