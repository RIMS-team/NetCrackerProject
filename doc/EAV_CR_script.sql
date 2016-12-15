﻿drop table OBJTYPE CASCADE CONSTRAINTS;
drop table ATTRTYPE CASCADE CONSTRAINTS;
drop table OBJECTS CASCADE CONSTRAINTS;
drop table ATTRIBUTES CASCADE CONSTRAINTS;
drop table OBJREFERENCE CASCADE CONSTRAINTS;

CREATE TABLE OBJTYPE
  (
    OBJECT_TYPE_ID NUMBER(20) NOT NULL ENABLE,
    PARENT_ID      NUMBER(20),
    CODE           VARCHAR2(20) NOT NULL UNIQUE,
    NAME           VARCHAR2(200 BYTE),
    DESCRIPTION    VARCHAR2(1000 BYTE),
    CONSTRAINT CON_OBJECT_TYPE_ID PRIMARY KEY (OBJECT_TYPE_ID),
    CONSTRAINT CON_PARENT_ID FOREIGN KEY (PARENT_ID) REFERENCES OBJTYPE (OBJECT_TYPE_ID) ON DELETE CASCADE ENABLE
  );

CREATE TABLE ATTRTYPE (
    ATTR_ID      		NUMBER(20) NOT NULL,
    OBJECT_TYPE_ID 		NUMBER(20) NOT NULL,
    OBJECT_TYPE_ID_REF 	NUMBER(20),
    CODE         		VARCHAR2(20),
    NAME         		VARCHAR2(200 BYTE),
    CONSTRAINT CON_ATTR_ID PRIMARY KEY (ATTR_ID),
    CONSTRAINT CON_ATTR_OBJECT_TYPE_ID FOREIGN KEY (OBJECT_TYPE_ID) REFERENCES OBJTYPE (OBJECT_TYPE_ID),
    CONSTRAINT CON_ATTR_OBJECT_TYPE_ID_REF FOREIGN KEY (OBJECT_TYPE_ID_REF) REFERENCES OBJTYPE (OBJECT_TYPE_ID)
);

CREATE TABLE OBJECTS (
    OBJECT_ID      NUMBER(20) NOT NULL,
    PARENT_ID      NUMBER(20),
    OBJECT_TYPE_ID NUMBER(20) NOT NULL,
    NAME           VARCHAR2(2000 BYTE),
    DESCRIPTION    VARCHAR2(4000 BYTE),
    CONSTRAINT CON_OBJECTS_ID PRIMARY KEY (OBJECT_ID),
    CONSTRAINT CON_PARENTS_ID FOREIGN KEY (PARENT_ID) REFERENCES OBJECTS (OBJECT_ID) ON DELETE CASCADE DEFERRABLE,
    CONSTRAINT CON_OBJ_TYPE_ID FOREIGN KEY (OBJECT_TYPE_ID) REFERENCES OBJTYPE (OBJECT_TYPE_ID)
);

CREATE TABLE ATTRIBUTES
  (
    ATTR_ID    NUMBER(20) NOT NULL,
    OBJECT_ID  NUMBER(20) NOT NULL,
    VALUE      VARCHAR2(4000 BYTE),
    DATE_VALUE DATE,
    CONSTRAINT CON_ATTRIBUTES_PK PRIMARY KEY (ATTR_ID,OBJECT_ID),
    CONSTRAINT CON_AOBJECT_ID FOREIGN KEY (OBJECT_ID) REFERENCES OBJECTS (OBJECT_ID) ON DELETE CASCADE,
    CONSTRAINT CON_AATTR_ID FOREIGN KEY (ATTR_ID) REFERENCES ATTRTYPE (ATTR_ID) ON DELETE CASCADE
  );  

CREATE TABLE OBJREFERENCE
  (
    ATTR_ID   NUMBER(20) NOT NULL,
    REFERENCE NUMBER(20) NOT NULL,
    OBJECT_ID NUMBER(20) NOT NULL,
    CONSTRAINT CON_OBJREFERENCE_PK PRIMARY KEY (ATTR_ID,REFERENCE,OBJECT_ID),
    CONSTRAINT CON_REFERENCE FOREIGN KEY (REFERENCE) REFERENCES OBJECTS (OBJECT_ID) ON DELETE CASCADE,
    CONSTRAINT CON_ROBJECT_ID FOREIGN KEY (OBJECT_ID) REFERENCES OBJECTS (OBJECT_ID) ON DELETE CASCADE,
    CONSTRAINT CON_RATTR_ID FOREIGN KEY (ATTR_ID) REFERENCES ATTRTYPE (ATTR_ID) ON DELETE CASCADE
  ); 

INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) VALUES (1, NULL, 'EMPLOYEE','Работник', NULL);
INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) VALUES (2, 1, 'User', 'Сотрудник', NULL);
INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) VALUES (3, 2, 'ADMIN', 'Администратор', NULL);
INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) VALUES (4, NULL, 'INVENTORY', 'Устройство', NULL);
INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) VALUES (5, NULL, 'ORDER', 'Запрос', NULL);
INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) VALUES (6, 4, 'CARD', 'Карта', NULL);
INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) VALUES (7, 4, 'NOTEPAD', 'Ноутбук', NULL);
INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) VALUES (8, 5, 'NOTIFICATION', 'Уведомление', NULL);
INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) VALUES (9, NULL, 'INV_STATUS', 'Статус устройства', NULL);
INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) VALUES (10, NULL, 'ORD_STATUS', 'Статус заявки', NULL);

INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (1, 1, NULL, 'FUll_NAME', 'Имя');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (2, 1, NULL, 'EMAIL', 'Почтовый адрес');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (3, 1, NULL, 'PHONE_NUMBER', 'Телефонный номер');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (4, 2, NULL, 'PASSWORD', 'Пароль');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (6, 5, 2, 'USER_FROM', 'Кто выдал');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (7, 5, 1, 'EMPLOYEE_TO', 'Кому выдан');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (8, 5, 4, 'INVENTORY', 'Устройство');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (9, 7, NULL, 'NAME', 'Имя');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (10, 7, NULL, 'LOCATION', 'Место');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (11, 7, NULL, 'MEMORY_TYPE', 'Тип памяти');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (12, 7, NULL, 'MODEL', 'Модель');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (13, 7, NULL, 'A_F_N', 'Ключевой номер');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (14, 7, NULL, 'SERIAL_NUMBER', 'Серийный номер');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (15, 5, NULL, 'DATE', 'Дата');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (16, 4, 9, 'STATUS', 'Статус устройства');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (17, 6, NULL,'CARD_ID', 'Уникальный номер');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (19, 5, 10, 'ORDER_STATUS', 'Статус заявки');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (20, 8, NULL, 'FIRST_NOTIFICATION', 'Первое уведомление');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (21, 8, NULL, 'SECOND_NOTIFICATION', 'Второе уведомление');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (22, 8, NULL, 'THIRD_NOTIFICATION', 'Третье уведомление');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (23, 9, NULL, 'INV_ENUM_VALUE', 'Значение INV_STATUS_ENUM');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) VALUES (24, 10, NULL, 'INV_ENUM_VALUE', 'Значение ORD_STATUS_ENUM');


INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (1, NULL, 3, 'Евгений', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (2, NULL, 1, 'Владимир', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (3, NULL, 7, 'Asus', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (4, NULL, 5, 'Order_1', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (5, NULL, 7, 'Apple', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (6, NULL, 7, 'Sony', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (7, NULL, 7, 'Hp', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (8, NULL, 1, 'Жора', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (9, NULL, 1, 'Иван', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (10, NULL, 1, 'Киррил', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (11, NULL, 1, 'Настя', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (12, NULL, 1, 'Ира', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (13, NULL, 2, 'Наташа', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (14, NULL, 2, 'Гоша', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (15, NULL, 7, 'Sony2', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (16, NULL, 7, 'Hp2', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (17, NULL, 5, 'Order_2', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (18, NULL, 5, 'Order_3', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (19, NULL, 5, 'Order_4', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (20, NULL, 5, 'Order_5', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (21, NULL, 5, 'Order_6', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (22, 4, 8, 'Notification_1', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (23, 17, 8, 'Notification_2', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (24, 18, 8, 'Notification_3', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (25, 19, 8, 'Notification_4', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (26, 20, 8, 'Notification_5', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (27, 21, 8, 'Notification_6', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (28, NULL, 9, 'InvStatus1', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (29, NULL, 9, 'InvStatus2', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (30, NULL, 9, 'InvStatus3', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (31, NULL, 10, 'Ord_status1', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (32, NULL, 10, 'Ord_status2', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (33, NULL, 10, 'Ord_status3', NULL);
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (34, NULL, 10, 'Ord_status4', NULL);


INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (1, 1, 'Евгений', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (2, 1, 'evgeniy@gmail.com', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (3, 1, '0945678936', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (4, 1, 'Hferfccrf', NULL);

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (1, 2, 'Владимир', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (2, 2, 'vladimir@gmail.com', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (3, 2, '0945672434', NULL);

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (1, 8, 'Жора', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (2, 8, 'georgiy@gmail.com', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (3, 8, '0974057439', NULL);

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (1, 9, 'Иван', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (2, 9, 'ivan@gmail.com', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (3, 9, '098946985', NULL);

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (1, 10, 'Киррил', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (2, 10, 'kiril@gmail.com', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (3, 10, '090485850', NULL);

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (1, 11, 'Настя', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (2, 11, 'nastya@gmail.com', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (3, 11, '096865466', NULL);

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (1, 12, 'Ира', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (2, 12, 'ira@gmail.com', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (3, 12, '094456457', NULL);

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (1, 13, 'Наташа', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (2, 13, 'natasha@gmail.com', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (3, 13, '0945678936', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (4, 13, 'qwerty', NULL);

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (1, 14, 'Гоша', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (2, 14, 'goha@gmail.com', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (3, 14, '0945678936', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (4, 14, 'uryth5r', NULL);

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (9, 3, 'Asus', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (10, 3, 'Odessa', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (11, 3, '8gb', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (12, 3, 'One soul', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (13, 3, '45362', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (14, 3, 'ht-856', NULL);

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (9, 5, 'Apple', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (10, 5, 'Odessa', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (11, 5, '8gb', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (12, 5, 'First', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (13, 5, '67890', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (14, 5, 'ht-100', NULL);

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (9, 6, 'Sony', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (10, 6, 'Odessa', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (11, 6, '4gb', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (12, 6, 'Serewer', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (13, 6, '12345', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (14, 6, 'ht-101', NULL);

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (9, 7, 'Hp', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (10, 7, 'Odessa', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (11, 7, '6gb', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (12, 7, 'Altec', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (13, 7, '98765', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (14, 7, 'ht-102', NULL);

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (9, 15, 'Sony', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (10, 15, 'Odessa', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (11, 15, '8gb', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (12, 15, 'Golden', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (13, 15, '34567', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (14, 15, 'ht-103', NULL);

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (9, 16, 'Hp', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (10, 16, 'Odessa', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (11, 16, '6gb', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (12, 16, 'Briliant', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (13, 16, '97542', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (14, 16, 'ht-104', NULL);

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (15, 4, NULL, to_date('10.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (15, 17, NULL, to_date('9.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (15, 18, NULL, to_date('8.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (15, 19, NULL, to_date('7.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (15, 20, NULL, to_date('6.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (15, 21, NULL, to_date('5.11.2016', 'DD.MM.YYYY'));

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (20, 22, NULL, to_date('11.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (21, 22, NULL, to_date('16.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (22, 22, NULL, to_date('21.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (20, 23, NULL, to_date('11.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (21, 23, NULL, to_date('16.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (22, 23, NULL, to_date('21.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (20, 24, NULL, to_date('11.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (21, 24, NULL, to_date('16.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (22, 24, NULL, to_date('21.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (20, 25, NULL, to_date('11.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (21, 25, NULL, to_date('16.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (22, 25, NULL, to_date('21.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (20, 26, NULL, to_date('11.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (21, 26, NULL, to_date('16.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (22, 26, NULL, to_date('21.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (20, 27, NULL, to_date('11.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (21, 27, NULL, to_date('16.11.2016', 'DD.MM.YYYY'));
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (22, 27, NULL, to_date('21.11.2016', 'DD.MM.YYYY'));

INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (23, 28, 'IN USE', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (23, 29, 'IN STOCK', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (23, 30, 'ON DIAGNOSTICS', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (24, 31, 'issued', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (24, 32, 'extended', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (24, 33, 'closed', NULL);
INSERT INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE)VALUES (24, 34, 'overdue', NULL);


INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (16, 28, 3);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (16, 28, 5);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (16, 28, 6);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (16, 28, 7);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (16, 28, 15);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (16, 28, 16);

INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (6, 1, 4);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (7, 2, 4);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (8, 3, 4);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (19, 31, 4);

INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (6, 1, 17);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (7, 8, 17);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (8, 5, 17);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (19, 31, 17);

INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (6, 13, 18);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (7, 9, 18);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (8, 6, 18);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (19, 31, 18);

INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (6, 13, 19);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (7, 10, 19);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (8, 7, 19);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (19, 31, 19);

INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (6, 14, 20);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (7, 11, 20);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (8, 15, 20);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (19, 31, 20);

INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (6, 14, 21);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (7, 12, 21);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (8, 16, 21);
INSERT INTO OBJREFERENCE (ATTR_ID,REFERENCE,OBJECT_ID) VALUES (19, 31, 21);

commit;

