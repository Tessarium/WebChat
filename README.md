# Chat

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Task
Решение для тестового задания elixir-phoenix.

Необходимо разработать webchat.
После захода на главную страницу пользователь вводит свое имя и попадает на страницу созданных чатов. Выбирает тот чат, где хочет общаться либо создает новый.
Каждое сообщение, которое пишет пользователь автоматом попадает в конец текущего чата у всех пользователей сразу.
Сообщения хранятся в БД.
Внешний вид существенной роли не играет. Можно использовать стандартный bootstrap.
По желанию использовать websockets встроенные в Phoenix.
Реализация проекта на Elixir с использованием Phoenix.
