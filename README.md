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
