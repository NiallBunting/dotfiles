all: lint test run #help Full check

help:
	@echo "-- HELP --"
	@grep '#[h]elp' makefile

init: #help Run through dependencies and check
	go --version

install: #help Install packages
	go get .

build: #help Bulid the project files
	go build .

run: #help Run Locally
	go run .

lint: #help Run linting
	@echo Not Implemented

test: #help Run the unit tests
	go test

e2e: #help Run the e2e tests
	@echo Not Implemented

plan: #help Plan to run any infra changes
	@echo Not Implemented

deploy: #help Run any infra changes
	@echo Not Implemented
