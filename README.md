# README
This is simple Ruby Auth API

# POST /users
curl --header "Content-Type: application/json" \
     --request POST \
     --data '{"email": "x1@x.x", "password": "Password1!", "passwordConfirmation": "Password1!"}' \
     http://localhost:4000/api/v1/users

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

# POST /auth/login
curl --header "Content-Type: application/json" \
     --request POST \
     --data '{"email": "x1@x.x", "password": "Password1!"}' \
     http://localhost:4000/api/v1/auth/login

# POST /auth/refresh
curl --header "Content-Type: application/json" \
     --request POST \
     --cookie "jid=refresh_token"
     http://localhost:4000/api/v1/auth/refresh

# POST /pets
curl -X POST \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer:token" \
     --data '{"name": "Kola", "kind": "cat"}' \
     http://localhost:4000/api/v1/pets

# GET /pets
curl -X GET \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer:token" \
     http://localhost:4000/api/v1/pets