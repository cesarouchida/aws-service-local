.DEFAULT_GOAL := all

# aws --endpoint-url=http://localhost:4566 s3 <args>
ENDPOINT_URL=http://localhost:4566
AWS_CLI=aws --endpoint-url=${ENDPOINT_URL}

initial:
	docker-compose up -d

s3:
	timeout 20
	${AWS_CLI} s3 mb s3://teste
	${AWS_CLI} s3 cp ./s3/teste.csv s3://teste

all: initial s3
	echo INICIALIZANDO