# HomeshareApi

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Endpoints
- GET `/api/accomodations/`
- POST `/api/accomodations/`
  - name:string
  - description:text
  - type:string, max_guests:integer
  - street:string
  - unit:string
  - city:string
  - state:string
  - zip:integer
  - user_id:integer
 - PUT `/api/accomodations/:id`
   - name:string
   - description:text
   - type:string, max_guests:integer
   - street:string
   - unit:string
   - city:string
   - state:string
   - zip:integer
   - user_id:integer
 - GET `/api/accomodations/:id`
 - DELETE `/api/accomodations/:id`

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
