# Build backend
# Install Wire
go install github.com/google/wire/cmd/wire@latest
# Generate code using Wire
wire gen -tags oss ./pkg/server ./pkg/cmd/grafana-cli/runner
# Build the backend
go run build.go build

# Build frontend
# Install the related dependencies
yarn install --immutable
# Build and watch all available plugins
yarn plugin:build:dev
