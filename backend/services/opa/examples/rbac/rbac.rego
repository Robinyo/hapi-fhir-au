package rbac

# Logic that implements RBAC
default allow := false

allow if {
	# Lookup the list of roles for the user
	roles := user_roles[input.consumer.username]

	# For each role in that list
	r := roles[_]

	# Lookup the permissions list for role r
	permissions := role_permissions[r]

	# For each permission
	p := permissions[_]

	# Check if the permission granted to r matches the users request
  p == {"permission": token.payload.scope}
}

bearer_token := t if {
	# v := input.attributes.request.http.headers.authorization
	v := input.request.headers.Authorization
	startswith(v, "Bearer ")
	t := substring(v, count("Bearer "), -1)
}

token := payload if {
	[_, payload, _] := io.jwt.decode(bearer_token)
}