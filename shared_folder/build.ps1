# Build backend
go run build.go setup
go run build.go build

# Build frontend
yarn install --pure-lockfile
