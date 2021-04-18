# README
This is simple Ruby Auth API

# Create a user
curl --header "Content-Type: application/json" \
     --request POST \
     --data '{"email": "x1@x.x", "password": "Password1!", "passwordConfirmation": "Password1!"}' \
     http://localhost:4000/api/v1/users/create


# Login
curl --header "Content-Type: application/json" \
     --request POST \
     --data '{"email": "x1@x.x", "password": "Password1!"}' \
     http://localhost:4000/api/v1/users/login

# Get Users (paginated)
curl -X GET \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer:token" \
     http://localhost:4000/api/v1/users\?page\=9\&per_page\=4