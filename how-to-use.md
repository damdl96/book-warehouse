# Run the application

To run all tests:
```
rspec
```

To run the local server:
```
rails s
```

# Application usage

## UI (dashboard):
Run the application and access: http://localhost:3000/ on your browser.

## API usage:
To test the API i suggest using [insomnia](https://insomnia.rest/)
Run the application and authenticate with the next credentials:

- http://localhost:3000/auth/sign_in
```
{
  "email": "test1@testemail.com",
  "password": "password"
}
```
Once authenticated you can retrieve the authorization from the request, attach it to the header of each of the requests.

i.e.
```
Authorization: Bearer eyJhY2Nlc3MtdG9rZW4iOiJabDYxTC1iZTlYZmdDQU1BaHphYU53IiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6IkJ0YWJEckNOdnA0c2RnUmNSd3RNTUEiLCJleHBpcnkiOiIxNjY3NTc1MjA0IiwidWlkIjoidGVzdDFAdGVzdGVtYWlsLmNvbSJ9
```

### Books

#### CREATE
**Request**
```
http://localhost:3000/books
```
**body (JSON)**
```
{
  "title": "Fahrenheit 451",
  "author": "Ray Bradbury",
  "genre": "fiction"
}
```

#### DESTROY
**Request**
```
http://localhost:3000/books/#{id}
```

### Inventories

#### INDEX
**Request**
```
http://localhost:3000/inventories
```

#### CREATE
**Request**
```
http://localhost:3000/inventories
```
**body (JSON)**
```
{
  "product_id": "3",
  "product_type": "Book",
  "quantity":"250"
}
```

#### UPDATE
**Request**
```
http://localhost:3000/inventories/#{id}
```
**body (JSON)**
```
{
  "quantity": "777"
}
```

### Users

#### SIGN IN
**Request**
```
http://localhost:3000/auth/sign_in
```
**body (JSON)**
```
{
  "email": "test1@testemail.com",
  "password": "password"
}
```

#### SIGN UP
**Request**
```
http://localhost:3000/auth/
```
**body (JSON)**
```
{
  "first_name": "John",
  "last_name": "Marston",
  "email": "test@email.com",
  "password": "password",
  "password_confirmation": "password"
}
```