DB_NAME = "mysql-petclinic-vet"
VET_SERVER_NAME = "spring-petclinic-rest-vet"

db-build:
	docker build \
		-f docker/db.Dockerfile \
		-t $(DB_NAME) .

db-run:
	docker run -d--rm \
		--name=mysql-petclinic-vet \
		-h localhost \
		-p 3307:3306 \
		-e MYSQL_ROOT_PASSWORD=petclinic \
		-e MYSQL_DATABASE=petclinic \
		$(DB_NAME)

app-build:
	docker build \
		-f docker/app.Dockerfile \
		-t $(VET_SERVER_NAME) .

app-run:
	docker run -d --rm \
		--name=spring-petclinic-vet \
		-h localhost \
		--link=mysql-petclinic-owner \
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