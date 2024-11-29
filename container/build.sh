sudo docker build -t kueski-ia ./
sudo docker run \
    --name kueski_ia \
    --port 5000:5000 \
    --detach kueski-ia:latest
