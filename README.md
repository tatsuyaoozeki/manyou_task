## バージョン
- Ruby 2.5.1
- Ruby on Rails 5.2.3
- psql (PostgreSQL) 11.3

## 準備
```
$ heroku login
$ rails assets:precompile RAILS_ENV=production
$ git add -A
$ git commit -m ""
$ heroku create
$ heroku buildpacks
$ heroku buildpacks:set --index 1 heroku/nodejs
$ heroku buildpacks:set --index 2 heroku/ruby
$ git push heroku master
$ heroku run rails db:migrate
```

## ER図
| user  |
|---|
| id |
| name :string |
| email :string |
| password_digest :string |


| task  |
|----|
| id |
| user_id |
| task_name :string |
| task_content :string |
| expiration_date :integer |
| priority :string |
| status :string |



| label  |
|---|
| id |
| name :string |



| labeling  |
|---|
| user_id |
| task_id |
