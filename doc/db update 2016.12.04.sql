-- db update 2016.12.04

--=====================================================================

update ATTRTYPE set code = 'INV_STATUS' where attr_id = 23;
update ATTRTYPE set code = 'ORD_STATUS' where attr_id = 24;

--=====================================================================

-- Create table
create table LISTTYPE
(
  ID            number not null,
  ATTRTYPE_CODE VARCHAR2(20) not null,
  CODE          VARCHAR2(30) not null,
  NAME          VARCHAR2(200) not null,
  COMMENTS      VARCHAR2(200)
)
;
-- Add comments to the columns 
comment on column LISTTYPE.id
  is 'Идентификатор элемента списка. На него идет ссылка из ATTRIBUTES.VALUE для списочных элементов';
comment on column LISTTYPE.attrtype_code
  is 'Принадлежность элемента списка к группе по коду типа атрибута';
comment on column LISTTYPE.code
  is 'Код-значение элемента списка для программного кода';
comment on column LISTTYPE.name
  is 'Имя значения элемента для UI';
comment on column LISTTYPE.comments
  is 'Комментарий';

-- Create/Recreate primary, unique and foreign key constraints 
alter table LISTTYPE
  add constraint pk_listtype primary key (ID);
alter table LISTTYPE
  add constraint uniq_listtype unique (ATTRTYPE_CODE, CODE);

--=======================================================================

insert into LISTTYPE (id, attrtype_code, code, name, comments)
  values (1, 'INV_STATUS', 'IN_USE', 'Используется', 'Статус инвентаря');
insert into LISTTYPE (id, attrtype_code, code, name, comments)
  values (2, 'INV_STATUS', 'IN_STOCK', 'На складе', 'Статус инвентаря');
insert into LISTTYPE (id, attrtype_code, code, name, comments)
  values (3, 'INV_STATUS', 'ON_DIAGNOSTICS', 'На диагностике', 'Статус инвентаря');
insert into LISTTYPE (id, attrtype_code, code, name, comments)
  values (4, 'ORD_STATUS', 'REQUEST', 'Затребован', 'Статус ордера');
insert into LISTTYPE (id, attrtype_code, code, name, comments)
  values (5, 'ORD_STATUS', 'ISSUED', 'Открыт', 'Статус ордера');
insert into LISTTYPE (id, attrtype_code, code, name, comments)
  values (6, 'ORD_STATUS', 'EXTENDED', 'Продлен', 'Статус ордера');
insert into LISTTYPE (id, attrtype_code, code, name, comments)
  values (7, 'ORD_STATUS', 'CLOSED', 'Закрыт', 'Статус ордера');
insert into LISTTYPE (id, attrtype_code, code, name, comments)
  values (8, 'ORD_STATUS', 'OVERDUE', 'Просрочен', 'Статус ордера');
commit;

--======================================================================

update ATTRIBUTES set value = 1 where attr_id = 23 and object_id = 28 ;
update ATTRIBUTES set value = 2 where attr_id = 23 and object_id = 29 ;
update ATTRIBUTES set value = 3 where attr_id = 23 and object_id = 30 ;
update ATTRIBUTES set value = 5 where attr_id = 24 and object_id = 31 ;
update ATTRIBUTES set value = 6 where attr_id = 24 and object_id = 32 ;
update ATTRIBUTES set value = 7 where attr_id = 24 and object_id = 33 ;
update ATTRIBUTES set value = 8 where attr_id = 24 and object_id = 34 ;

--=====================================================================

