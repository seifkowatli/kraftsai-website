IMAGE_NAME="krafts-soon"
CONTAINER_ID=$(docker ps -q --filter "ancestor=$IMAGE_NAME")

if [ ! -z "$CONTAINER_ID" ]; then
  echo "Stopping existing container: $CONTAINER_ID"
  docker stop $CONTAINER_ID

  echo "Removing Old Image..."
  docker rm $IMAGE_NAME
fi


echo "Building new image..."
docker build -t $IMAGE_NAME .

echo "Running new container..."
docker run -d -p 5210:80 --name $IMAGE_NAME $IMAGE_NAME

