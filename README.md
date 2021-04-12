# README
This is simple Ruby Auth API

# Create a user
curl --header "Content-Type: application/json" \
     --request POST \
     --data '{"user": {"email": "x@x.x", "password": "asdf", "password_confirmation": "asdf"}}' \
     http://localhost:4000/api/v1/users/create


# Login
curl --header "Content-Type: application/json" \
     --request POST \
     --data '{"user": {"email": "x@x.x", "password": "asdf"}}' \
     http://localhost:4000/api/v1/users/login

# Get resources
curl --header "Content-Type: application/json" \
     --header "Authorization Bearer:token"
     --request GET \
     http://localhost:4000/api/v1/users/resources