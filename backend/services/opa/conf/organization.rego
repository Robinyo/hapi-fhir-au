package organisation.system

default allow := false

allow if {
	is_organization
	is_client
	contains(token.scope, "system/Organization.read")
}

is_client if token.azp == "oauth2-proxy"
is_organization if input.request.path == "/Organization"

bearer_token := t if {
	v := input.request.headers.authorization
	startswith(v, "Bearer ")
	t := substring(v, count("Bearer "), -1)
}

token := payload if {
	[_, payload, _] := io.jwt.decode(bearer_token)
}
