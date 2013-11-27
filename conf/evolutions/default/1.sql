# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table bug (
  id                        bigint not null,
  name                      varchar(255),
  is_done                   boolean,
  due_date                  timestamp,
  assigned_to_email         varchar(255),
  folder                    varchar(255),
  project_id                bigint,
  constraint pk_bug primary key (id))
;

create table project (
  id                        bigint not null,
  name                      varchar(255),
  folder                    varchar(255),
  constraint pk_project primary key (id))
;

create table user (
  email                     varchar(255) not null,
  name                      varchar(255),
  password                  varchar(255),
  constraint pk_user primary key (email))
;


create table project_user (
  project_id                     bigint not null,
  user_email                     varchar(255) not null,
  constraint pk_project_user primary key (project_id, user_email))
;
create sequence bug_seq;

create sequence project_seq;

create sequence user_seq;

alter table bug add constraint fk_bug_assignedTo_1 foreign key (assigned_to_email) references user (email) on delete restrict on update restrict;
create index ix_bug_assignedTo_1 on bug (assigned_to_email);
alter table bug add constraint fk_bug_project_2 foreign key (project_id) references project (id) on delete restrict on update restrict;
create index ix_bug_project_2 on bug (project_id);



alter table project_user add constraint fk_project_user_project_01 foreign key (project_id) references project (id) on delete restrict on update restrict;

alter table project_user add constraint fk_project_user_user_02 foreign key (user_email) references user (email) on delete restrict on update restrict;

# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists bug;

drop table if exists project;

drop table if exists project_user;

drop table if exists user;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists bug_seq;

drop sequence if exists project_seq;

drop sequence if exists user_seq;

