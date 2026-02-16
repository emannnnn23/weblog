# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
feb 16 2026
  User Profile Feature

This project now includes a fully functional **user profile system**, with the ability to create, edit, and view profiles. The system also supports file attachments using Active Storage.
 Changes in This Update
-  Files Added / Modified
  - `app/controllers/profiles_controller.rb` – Controller managing profile actions (CRUD).
  - `app/views/profiles/new.html.erb` – Form to create a new profile.
  - `app/views/profiles/edit.html.erb` – Form to edit an existing profile.
  - `app/views/profiles/show.html.erb` – Page to display a user's profile.
  - `db/migrate/20260213052720_create_active_storage_tables.active_storage.rb` – Migration for Active Storage tables.

- Statistics
  - Files changed: 17
  - Insertions: 317 lines
  - Deletions: 65 lines
  - 
- Features
 - Create, edit, and view user profiles.
 - Attach profile pictures or other files using Active Storage.
 - Secure handling of user profile data.

















