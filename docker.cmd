docker build --tag hello_redis:0.1 --file Dockerfile .

docker run --detach --publish 5000:5000 --name registry registry:2.8.2

docker push localhost:5000/hello_redis

