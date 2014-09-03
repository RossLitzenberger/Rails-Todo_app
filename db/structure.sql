CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "todo_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "todo_list_id" integer, "content" varchar(255), "created_at" datetime, "updated_at" datetime, "completed_at" datetime);
CREATE TABLE "todo_lists" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "description" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(255), "last_name" varchar(255), "email" varchar(255), "password_digest" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_todo_items_on_todo_list_id" ON "todo_items" ("todo_list_id");
CREATE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20131204224505');

INSERT INTO schema_migrations (version) VALUES ('20131209232612');

INSERT INTO schema_migrations (version) VALUES ('20131211194851');

INSERT INTO schema_migrations (version) VALUES ('20140130223357');

