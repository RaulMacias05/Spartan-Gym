BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
CREATE TABLE IF NOT EXISTS "clientes_clientes" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nombre" varchar(100) NOT NULL, "telefono" varchar(20) NOT NULL, "correo" varchar(254) NOT NULL, "direccion" varchar(200) NOT NULL);
CREATE TABLE IF NOT EXISTS "clientes_registroasistencia" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "fecha" date NOT NULL, "hora_entrada" datetime NULL, "hora_salida" datetime NULL, "cliente_id" bigint NOT NULL REFERENCES "clientes_clientes" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" bigint NOT NULL REFERENCES "usuarios_usuario" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "inventario_producto" ("idproducto" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nombre" varchar(100) NOT NULL, "descripcion" text NOT NULL, "precio" decimal NOT NULL, "stock" integer NOT NULL, "is_active" bool NOT NULL, "imagen" varchar(100) NOT NULL, "fecha_creacion" datetime NOT NULL, "fecha_modificacion" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "usuarios_usuario" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(150) NOT NULL, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "rol" varchar(10) NOT NULL, "telefono" varchar(20) NOT NULL, "direccion" varchar(255) NOT NULL, "primer_apellido" varchar(50) NOT NULL, "segundo_apellido" varchar(50) NOT NULL);
CREATE TABLE IF NOT EXISTS "usuarios_usuario_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "usuario_id" bigint NOT NULL REFERENCES "usuarios_usuario" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "usuarios_usuario_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "usuario_id" bigint NOT NULL REFERENCES "usuarios_usuario" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "ventas_detalleventa" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "precio_unitario" decimal NOT NULL, "cantidad" integer unsigned NOT NULL CHECK ("cantidad" >= 0), "producto_id" integer NOT NULL REFERENCES "inventario_producto" ("idproducto") DEFERRABLE INITIALLY DEFERRED, "venta_id" bigint NOT NULL REFERENCES "ventas_venta" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "ventas_venta" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "fecha_venta" datetime NOT NULL, "monto_total" decimal NOT NULL, "metodo_pago" varchar(50) NOT NULL, "monto_pagado" decimal NOT NULL, "cambio" decimal NULL, "usuario_id" bigint NULL REFERENCES "usuarios_usuario" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_contenttype','Can add content type'),
 (14,4,'change_contenttype','Can change content type'),
 (15,4,'delete_contenttype','Can delete content type'),
 (16,4,'view_contenttype','Can view content type'),
 (17,5,'add_session','Can add session'),
 (18,5,'change_session','Can change session'),
 (19,5,'delete_session','Can delete session'),
 (20,5,'view_session','Can view session'),
 (21,6,'add_usuario','Can add user'),
 (22,6,'change_usuario','Can change user'),
 (23,6,'delete_usuario','Can delete user'),
 (24,6,'view_usuario','Can view user'),
 (25,7,'add_detalleventa','Can add detalle venta'),
 (26,7,'change_detalleventa','Can change detalle venta'),
 (27,7,'delete_detalleventa','Can delete detalle venta'),
 (28,7,'view_detalleventa','Can view detalle venta'),
 (29,8,'add_venta','Can add venta'),
 (30,8,'change_venta','Can change venta'),
 (31,8,'delete_venta','Can delete venta'),
 (32,8,'view_venta','Can view venta'),
 (33,9,'add_producto','Can add producto'),
 (34,9,'change_producto','Can change producto'),
 (35,9,'delete_producto','Can delete producto'),
 (36,9,'view_producto','Can view producto'),
 (37,10,'add_clientes','Can add clientes'),
 (38,10,'change_clientes','Can change clientes'),
 (39,10,'delete_clientes','Can delete clientes'),
 (40,10,'view_clientes','Can view clientes'),
 (41,11,'add_membresia','Can add membresia'),
 (42,11,'change_membresia','Can change membresia'),
 (43,11,'delete_membresia','Can delete membresia'),
 (44,11,'view_membresia','Can view membresia'),
 (45,12,'add_registroasistencia','Can add registro asistencia'),
 (46,12,'change_registroasistencia','Can change registro asistencia'),
 (47,12,'delete_registroasistencia','Can delete registro asistencia'),
 (48,12,'view_registroasistencia','Can view registro asistencia');
INSERT INTO "clientes_clientes" ("id","nombre","telefono","correo","direccion") VALUES (1,'Raúl','8135745910','ari.sanchez2005@gmail.com','Del Arte 311'),
 (2,'Raúl','8135745910','ari.sanchez2005@gmail.com','Del Arte 311'),
 (3,'Ariel Macías','8135745910','raul.sanchezm@uanl.edu.com','Ciudad Universitaria');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'contenttypes','contenttype'),
 (5,'sessions','session'),
 (6,'usuarios','usuario'),
 (7,'ventas','detalleventa'),
 (8,'ventas','venta'),
 (9,'inventario','producto'),
 (10,'clientes','clientes'),
 (11,'membresias','membresia'),
 (12,'clientes','registroasistencia');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2025-04-26 21:52:01.653936'),
 (2,'contenttypes','0002_remove_content_type_name','2025-04-26 21:52:01.669684'),
 (3,'auth','0001_initial','2025-04-26 21:52:01.696625'),
 (4,'auth','0002_alter_permission_name_max_length','2025-04-26 21:52:01.710717'),
 (5,'auth','0003_alter_user_email_max_length','2025-04-26 21:52:01.722062'),
 (6,'auth','0004_alter_user_username_opts','2025-04-26 21:52:01.734491'),
 (7,'auth','0005_alter_user_last_login_null','2025-04-26 21:52:01.743856'),
 (8,'auth','0006_require_contenttypes_0002','2025-04-26 21:52:01.749437'),
 (9,'auth','0007_alter_validators_add_error_messages','2025-04-26 21:52:01.758793'),
 (10,'auth','0008_alter_user_username_max_length','2025-04-26 21:52:01.769134'),
 (11,'auth','0009_alter_user_last_name_max_length','2025-04-26 21:52:01.779267'),
 (12,'auth','0010_alter_group_name_max_length','2025-04-26 21:52:01.793258'),
 (13,'auth','0011_update_proxy_permissions','2025-04-26 21:52:01.801065'),
 (14,'auth','0012_alter_user_first_name_max_length','2025-04-26 21:52:01.811328'),
 (15,'usuarios','0001_initial','2025-04-26 21:52:01.828789'),
 (16,'admin','0001_initial','2025-04-26 21:52:01.846743'),
 (17,'admin','0002_logentry_remove_auto_add','2025-04-26 21:52:01.864150'),
 (18,'admin','0003_logentry_add_action_flag_choices','2025-04-26 21:52:01.874540'),
 (19,'inventario','0001_initial','2025-04-26 21:52:01.882824'),
 (20,'sessions','0001_initial','2025-04-26 21:52:01.893582'),
 (21,'usuarios','0002_alter_usuario_dni','2025-04-26 21:52:01.910548'),
 (22,'usuarios','0003_remove_usuario_dni_usuario_primer_apellido_and_more','2025-04-26 21:52:01.942273'),
 (23,'ventas','0001_initial','2025-04-26 21:52:01.980261'),
 (24,'clientes','0001_initial','2025-05-03 05:31:20.119147'),
 (25,'membresias','0001_initial','2025-05-06 03:43:47.928002'),
 (26,'clientes','0002_registroasistencia','2025-05-08 03:33:49.843071');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('0ui307wsojdzmugebengswwjxtjqa822','.eJxVjDsOwjAQBe_iGln-JV5T0ucM1q4_OIBsKU4qxN2RpRTQvpl5b-bx2Is_etr8GtmVKXb53QjDM9UB4gPrvfHQ6r6txIfCT9r50mJ63U7376BgL6PWKpsZIJDFlAlEMNEqEtGhQKmlNIDShgCEODsN1kSXpmQEwORUBvb5AvLHN94:1uCrMR:1hc1PhCjN3ALUIhKdOUekwrRa53t7fY1nsEEgAR3GDU','2025-05-22 02:51:47.670506');
INSERT INTO "inventario_producto" ("idproducto","nombre","descripcion","precio","stock","is_active","imagen","fecha_creacion","fecha_modificacion") VALUES (1,'Powerade 600ml Moras','Bebida Hidratante Powerade de 600 mililitros sabor moras',27,5,1,'productos/powerade_moras_Pq30a6U.jpg','2025-04-26 21:53:32.628624','2025-04-26 21:53:32.628712'),
 (2,'Agua Ciel 1L','Bebida Hidratante Powerade de 600 mililitros sabor moras',20,5,1,'productos/AGUA_CIEL_1L.jpg','2025-04-26 21:53:57.278834','2025-04-26 21:53:57.278931'),
 (3,'QUEST Hero Protein Bar','1.83 oz',50,20,1,'productos/barra_cookies_G12MLgu.jpg','2025-04-27 05:39:50.957416','2025-04-27 05:39:50.957491'),
 (4,'Monster 473 ml Energy Mango','Monster de 473 mililitros Energy Mango',35,50,1,'productos/monster_mango_OkBldpP.png','2025-05-03 06:22:21.854163','2025-05-03 06:22:21.854223'),
 (5,'Creatina 250g EVOLUTION','Creatina de 250 gramos marca EVOLUTION',250,20,1,'productos/creatina250g.png','2025-05-03 06:23:14.705645','2025-05-03 06:23:14.705676');
INSERT INTO "usuarios_usuario" ("id","password","last_login","is_superuser","username","first_name","last_name","email","is_staff","is_active","date_joined","rol","telefono","direccion","primer_apellido","segundo_apellido") VALUES (1,'pbkdf2_sha256$1000000$Hx01IxieSxDls56efmjBld$F3P5m5IGq8XRRtl474xN4Qa4idhlZhLQU2gHNWQuO2E=','2025-05-08 02:31:30.942635',1,'rasm2005','','','raul.sanchezm@uanl.edu.mx',1,1,'2025-04-26 22:08:27.731207','BASICO','','','',''),
 (2,'pbkdf2_sha256$1000000$lMgcSCNQvcDWwkTB7ttzwP$qNFPapj36ceLARhb2XxmoE/4PloyvbjTwNOuZ2G1p7c=','2025-05-08 02:51:47.658685',0,'rasm302005','Raúl Ariel','','ari.sanchez2005@gmail.com',0,1,'2025-05-08 02:32:57.618230','ADMIN','8135745910','','Sánchez','Macías');
INSERT INTO "ventas_detalleventa" ("id","precio_unitario","cantidad","producto_id","venta_id") VALUES (5,27,1,1,4),
 (6,20,1,2,4),
 (7,27,1,1,5),
 (8,20,1,2,5),
 (9,27,1,1,6),
 (10,27,1,1,7),
 (11,27,1,1,8),
 (12,20,1,2,8),
 (13,50,1,3,8),
 (14,50,1,3,9),
 (15,27,1,1,10),
 (16,20,1,2,10),
 (17,50,1,3,11),
 (18,27,1,1,11),
 (19,50,1,3,12),
 (20,20,1,2,12),
 (21,27,1,1,13),
 (22,20,1,2,13),
 (23,50,1,3,14),
 (24,250,1,5,14),
 (25,27,1,1,15),
 (26,250,1,5,15),
 (27,27,1,1,16),
 (28,20,1,2,16);
INSERT INTO "ventas_venta" ("id","fecha_venta","monto_total","metodo_pago","monto_pagado","cambio","usuario_id") VALUES (4,'2025-04-26 22:12:25.757447',47,'efectivo',51,4,1),
 (5,'2025-04-26 22:38:37.752609',47,'tarjeta',100,53,1),
 (6,'2025-04-27 05:25:51.243739',27,'efectivo',50,23,1),
 (7,'2025-04-27 05:26:53.025786',27,'tarjeta',100,73,1),
 (8,'2025-04-27 06:43:31.408886',97,'efectivo',100,3,1),
 (9,'2025-04-27 07:52:00.894709',50,'efectivo',50,0,1),
 (10,'2025-04-27 07:55:55.819036',47,'tarjeta',150,103,1),
 (11,'2025-04-27 07:56:08.141166',77,'efectivo',120,43,1),
 (12,'2025-04-27 07:56:21.106799',70,'tarjeta',100,30,1),
 (13,'2025-05-03 17:16:19.970429',47,'efectivo',150,103,1),
 (14,'2025-05-03 17:39:49.061039',300,'efectivo',300,0,1),
 (15,'2025-05-03 18:02:11.030690',277,'efectivo',300,23,1),
 (16,'2025-05-08 02:31:48.493421',47,'efectivo',150,103,1);
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "clientes_registroasistencia_cliente_id_09f06443" ON "clientes_registroasistencia" ("cliente_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE INDEX "usuarios_usuario_groups_group_id_e77f6dcf" ON "usuarios_usuario_groups" ("group_id");
CREATE INDEX "usuarios_usuario_groups_usuario_id_7a34077f" ON "usuarios_usuario_groups" ("usuario_id");
CREATE UNIQUE INDEX "usuarios_usuario_groups_usuario_id_group_id_4ed5b09e_uniq" ON "usuarios_usuario_groups" ("usuario_id", "group_id");
CREATE INDEX "usuarios_usuario_user_permissions_permission_id_4e5c0f2f" ON "usuarios_usuario_user_permissions" ("permission_id");
CREATE INDEX "usuarios_usuario_user_permissions_usuario_id_60aeea80" ON "usuarios_usuario_user_permissions" ("usuario_id");
CREATE UNIQUE INDEX "usuarios_usuario_user_permissions_usuario_id_permission_id_217cadcd_uniq" ON "usuarios_usuario_user_permissions" ("usuario_id", "permission_id");
CREATE INDEX "ventas_detalleventa_producto_id_a820c807" ON "ventas_detalleventa" ("producto_id");
CREATE INDEX "ventas_detalleventa_venta_id_c370bcd7" ON "ventas_detalleventa" ("venta_id");
CREATE INDEX "ventas_venta_usuario_id_a710a973" ON "ventas_venta" ("usuario_id");
COMMIT;
