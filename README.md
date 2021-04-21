# README
This is simple Ruby Auth API

# POST /users
curl --header "Content-Type: application/json" \
     --request POST \
     --data '{"email": "x1@x.x", "password": "Password1!", "passwordConfirmation": "Password1!"}' \
     http://localhost:4000/api/v1/users


# POST /users/login
curl --header "Content-Type: application/json" \
     --request POST \
     --data '{"email": "x1@x.x", "password": "Password1!"}' \
     http://localhost:4000/api/v1/users/login

# GET /users (paginated)
curl -X GET \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer:token" \
     http://localhost:4000/api/v1/users\?page\=9\&per_page\=4

# GET /users/me
curl -X GET \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer:token" \
     http://localhost:4000/api/v1/users/me


# POST /pet
curl -X POST \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer:token" \
     --data '{"name": "Kola", "kind": "cat"}' \
     http://localhost:4000/api/v1/pets