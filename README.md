# Developer Contact Details API

## Introduction

This API perform CRUD operations on Developer's contact details and categorize the developer's as either a front-end developer of backend developer and/or some other categories

## Technology
* Ruby
* Ruby on rails
* SQLite

## Dependencies

* Rails
* rspec-rails
* factory_bot_rails 
* shoulda_matchers
* database_cleaner
* faker

## Installation

1.  Clone this repo.
1.  Install dependencies with `bundle install`.
1.  Run the migrations and setup the database with `rails db:migrate && rails db:setup`
1.  Run the API server with `bin/rails server` or `bundle exec rails server` or `rails s`.

## How to run the test suite

* `bundle exec rspec`

## Tasks

-   `bin/rake routes` lists the endpoints available.
-   `bundle exec rspec` runs automated tests.
-   `bin/rails db` opens the database client.
-   `bin/rails server` starts the API.

## API Documentation

This is the [link to the API documentation](https://documenter.getpostman.com/view/4605460/RWgp1KU4).

### Developer

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/developers`          | `developers#create`|
| GET    | `/developers`          | `developers#index`    |
| GET    | `/developers/:id`      | `developers#show`    |
| PUT    | `/developers/:id`      | `developers#update`  |
| GET    | `/categories/:id/developers`          | `developers#getByCategory`    |
| DELETE | `/developers/:id`      | `developers#destroy`   |

#### POST /developers

Request:

```sh
curl --request POST \
  --url http://localhost:3000/developers \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data 'first_name=Ade&last_name=Baba&github_username=atomicman&email=blessingadesina%40gmail.com&phone_number=33322222&website=www.ade.com&country=Nigeria&category_id=1'
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
    "id": 1,
    "first_name": "Ade",
    "last_name": "Baba",
    "email": "blessingadesina@gmail.com",
    "github_username": "atomicman",
    "phone_number": "33322222",
    "website": "www.ade.com",
    "country": "Nigeria",
    "category_id": 1,
    "created_at": "2018-10-09T04:59:42.229Z",
    "updated_at": "2018-10-09T04:59:42.229Z"
  }
```

#### GET /developers

Request:

```sh
curl --request GET \
  --url http://localhost:3000/developers
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

[
    {
        "id": 3,
        "first_name": "Ade",
        "last_name": "Baba",
        "email": "blessingadesina@gmail.coma",
        "github_username": "atomicman",
        "phone_number": "33322222",
        "website": "www.ade.com",
        "country": "Nigeria",
        "category_id": 1,
        "created_at": "2018-10-09T05:59:06.325Z",
        "updated_at": "2018-10-09T05:59:06.325Z"
    },
    {
        "id": 4,
        "first_name": "Test 2",
        "last_name": "Last",
        "email": "blessingadesina@gmail.com",
        "github_username": "atomicman",
        "phone_number": "33322222",
        "website": "www.ade.com",
        "country": "Nigeria",
        "category_id": 2,
        "created_at": "2018-10-09T06:55:13.279Z",
        "updated_at": "2018-10-09T06:55:13.279Z"
    }
]
```

#### GET /developers/:id

Request:

```sh
curl --request GET \
  --url http://localhost:3000/developers/1 \
  --header 'Content-Type: application/x-www-form-urlencoded
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
    "id": 1,
    "first_name": "Ade",
    "last_name": "Baba",
    "email": "blessingadesina@gmail.com",
    "github_username": "atomicman",
    "phone_number": "33322222",
    "website": "www.ade.com",
    "country": "Nigeria",
    "category_id": 1,
    "created_at": "2018-10-09T04:59:42.229Z",
    "updated_at": "2018-10-09T04:59:42.229Z"
}

```

#### PUT /developers/:id

Request:

```sh
curl --request PUT \
  --url http://localhost:3000/developers/1 \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data first_name=Rename
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /developers/:id

Request:

```sh
curl --request DELETE \
  --url http://localhost:3000/developers/1 \
  --header 'Content-Type: application/x-www-form-urlencoded'
```

Response:

```md
HTTP/1.1 204 No Content
```

#### GET /categories/1/developers

Request:

```sh
curl --request GET \
  --url http://localhost:3000/categories/1/developers
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

[
    {
        "id": 3,
        "first_name": "Ade",
        "last_name": "Baba",
        "email": "blessingadesina@gmail.coma",
        "github_username": "atomicman",
        "phone_number": "33322222",
        "website": "www.ade.com",
        "country": "Nigeria",
        "category_id": 1,
        "created_at": "2018-10-09T05:59:06.325Z",
        "updated_at": "2018-10-09T05:59:06.325Z"
    },
    {
        "id": 4,
        "first_name": "Testing",
        "last_name": "Now",
        "email": "blessingadesina@gmail.com",
        "github_username": "atomicman",
        "phone_number": "33322222",
        "website": "www.ade.com",
        "country": "Nigeria",
        "category_id": 1,
        "created_at": "2018-10-09T06:55:13.279Z",
        "updated_at": "2018-10-09T06:55:13.279Z"
    }
]
```

### Categories

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/categories`          | `categories#create`|
| GET    | `/categories`          | `categories#index`    |
| GET    | `/categories/:id`      | `categories#show`    |
| PUT    | `/categories/:id`      | `categories#update`  |
| DELETE | `/categories/:id`      | `developers#destroy`   |

#### POST /categories

Request:

```sh
curl --request POST \
  --url http://localhost:3000/categories \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data name=Frontend%20Developer
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
    "id": 1,
    "name": "Frontend Developer",
    "created_at": "2018-10-09T04:59:42.229Z",
    "updated_at": "2018-10-09T04:59:42.229Z"
  }
```

#### GET /categories

Request:

```sh
curl --request GET \
  --url http://localhost:3000/categories \
  --header 'Content-Type: application/x-www-form-urlencoded'
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

[
    {
        "id": 1,
        "name": "Frontend Developer",
        "created_at": "2018-10-09T07:23:09.387Z",
        "updated_at": "2018-10-09T07:23:09.387Z"
    },
    {
        "id": 2,
        "name": "Backend Developer",
        "created_at": "2018-10-09T07:23:09.390Z",
        "updated_at": "2018-10-09T07:23:09.390Z"
    },
    {
        "id": 3,
        "name": "Fullstack Developer",
        "created_at": "2018-10-09T07:23:09.394Z",
        "updated_at": "2018-10-09T07:23:09.394Z"
    }
]
```

#### GET /categories/:id

Request:

```sh
curl --request GET \
  --url http://localhost:3000/categories/1 \
  --header 'Content-Type: application/x-www-form-urlencoded
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
    "id": 1,
    "name": "Frontend Developer",
    "created_at": "2018-10-09T04:59:42.229Z",
    "updated_at": "2018-10-09T04:59:42.229Z"
}

```

#### PUT /categories/:id

Request:

```sh
curl --request PUT \
  --url http://localhost:3000/categories/1 \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data name==Backend%20Developer
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /categories/:id

Request:

```sh
curl --request DELETE \
  --url http://localhost:3000/categories/1 \
  --header 'Content-Type: application/x-www-form-urlencoded'
```

Response:

```md
HTTP/1.1 204 No Content
```

## License

This project is authored by Philips Blessing and is licensed 
for your use, modification and distribution under [the MIT license](https://en.wikipedia.org/wiki/MIT_License).