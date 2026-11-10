# Configure movie data

Provide `REACT_APP_TMDB_API_KEY` in the process environment before running
`npm start` or `npm run build`. The current container runs `bun start`, which compiles the app at startup,
so supply the variable in the container environment when it starts. The
Dockerfile does not forward a Docker build argument. A static `npm run build`
deployment needs the value when that build runs.

Use a TMDB read API key whose owner has
authorized this app. The inherited hardcoded upstream key is no longer used.
Without configuration, movie rows make no TMDB requests.

Create React App embeds this value in the browser bundle. Environment
configuration does not make a browser API key private. Never supply a
privileged provider credential or account-management token here.

If Canepro deploys this app, use the deployment's approved Infisical consumer
to inject the variable into the process that compiles the app. No Canepro deployment or TMDB credential owner
has been established by this change, so no new secret or deployment consumer
is created. Local configuration files are ignored; the example contains no
value. Do not put a real value into Git, logs or reports.

The inherited key remains in upstream and historical commits. This normal
commit does not rotate it or rewrite history.

The Docker build context excludes local env files, Git history, dependencies
and prior build outputs. Only the empty `.env.example` is included.
