# README
This is simple Ruby Auth API

# Create a session
curl --header "Content-Type: application/json" \
     --request POST \
     --data '{"user": {"email": "x@x.x", "password": "asdf", "password_confirmation": "asdf"}}' \
     http://localhost:3000/sessions