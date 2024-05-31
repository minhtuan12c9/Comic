create database if not exists comic_web;
use comic_web;

create table if not exists user(
	id bigint primary key auto_increment,
    hoten nvarchar(250) not null,
    email nvarchar(250) not null,
	username varchar(250) not null,
    password varchar(250) not null,
    is_admin boolean default 0,
    avt varchar(250)
);
create table if not exists admin(
	id bigint primary key auto_increment,
    username nvarchar(250) not null,
    password varchar(250) not null,
    is_admin boolean default 1
);

create table if not exists theloai(
	id bigint primary key auto_increment,
    ten nvarchar(250) not null
);

create table if not exists truyen(
	id bigint primary key auto_increment,
    ten nvarchar(250) not null,
    avt varchar(250),
    gioithieu nvarchar(250) not null,
	tacgia nvarchar(250) not null,
    thoi_gian_dang datetime
);
CREATE TABLE IF NOT EXISTS truyen_theloai (
	id bigint primary key auto_increment,
    id_truyen bigint,
    id_theloai bigint,
    FOREIGN KEY (id_truyen) REFERENCES truyen(id),
    FOREIGN KEY (id_theloai) REFERENCES theloai(id)
);
create table if not exists chuong(
	id bigint primary key auto_increment,
    so bigint not null,
    ten nvarchar(250) not null,
    noidung varchar(250) not null,
    id_truyen bigint,
    thoi_gian_dang datetime,
    view integer default 0,
    foreign key (id_truyen) references truyen(id)
);
create table if not exists yeuthich(
	id bigint primary key auto_increment,
    id_user bigint,
    id_truyen bigint,
    foreign key (id_user) references user(id),
    foreign key (id_truyen) references truyen(id)
);
create table if not exists binhluan(
	id bigint primary key auto_increment,
    id_user bigint,
    id_truyen bigint,
    noidung nvarchar(250) not null,
    thoi_gian_dang datetime,
    foreign key (id_user) references user(id),
    foreign key (id_truyen) references truyen(id),
	luot_thich integer default 0
);
create table if not exists kiemtralike(
	id bigint primary key auto_increment,
    id_user bigint,
    id_binhluan bigint,
    thich boolean default 0,
    foreign key (id_user) references user(id),
    foreign key (id_binhluan) references binhluan(id)
);

create table if not exists lichsu(
	id bigint primary key auto_increment,
    id_user bigint,
    id_chuong bigint,
    id_truyen bigint,
    lan_cuoi_doc datetime,
    foreign key (id_user) references user(id),
    foreign key (id_chuong) references chuong(id),
    foreign key (id_truyen) references truyen(id)
);
create table if not exists slide(
	id bigint primary key auto_increment,
    id_truyen bigint,
    foreign key (id_truyen) references truyen(id)
);

INSERT INTO theloai (`ten`) VALUES 
('Hành động'),
('Khoa học'),
('Tình cảm'),
('Manhwa'),
('Hài hước'),
('Siêu nhiên'),
('Phiêu lưu');

