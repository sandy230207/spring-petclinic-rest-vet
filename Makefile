VET_SERVER_NAME = "sandy230207/spring-petclinic-rest-vet:v1"
# VET_SERVER_NAME = "a123453906/spring-petclinic-rest-vet:latest"

app-build:
	docker build \
		-f Dockerfile \
		-t $(VET_SERVER_NAME) .

app-push:
	docker push $(VET_SERVER_NAME)

app-run:
	docker run -d --rm \
		--name=spring-petclinic-vet \
		-h localhost \
		--link=mysql-petclinic \
		-e MYSQL_HOST=localhost \
		-e MYSQL_PASSWORD=petclinic \
		-p 9967:9967 \
		$(VET_SERVER_NAME)

run:
	./mvnw spring-boot:run

test:
	./mvnw test

build:
	./mvnw clean install

clean:
	./mvnw clean