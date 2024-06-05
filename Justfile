


default: killContainer buildAndRun 

buildAndRun:
    docker build -t apache .
    docker run --rm -d -p 8000:80 --hostname testing.com --name apache \
        --env-file .env  apache

killContainer:
    #!/bin/bash
    # Check if the container is running
    CONTAINER_NAME="apache"
    IMAGE_NAME="apache"
    if docker ps --filter "name=$CONTAINER_NAME" --filter "status=running" | grep $CONTAINER_NAME; then
    echo "Container $CONTAINER_NAME is running."
        # Stop the container
        docker stop $CONTAINER_NAME
        echo "Container $CONTAINER_NAME stopped."
    else
        echo "Container $CONTAINER_NAME is not running."
    fi
    if docker images --format "{{{{.Repository}}}}:{{{{.Tag}}}}" | grep "$IMAGE_NAME"; then
        # Remove the image
        docker rmi $IMAGE_NAME
        echo "Image $IMAGE_NAME deleted."
    else
        echo "Image $IMAGE_NAME does not exist."
    fi

runTests:
    npm run cy:run --record --spec "cypress/e2e/check-php.cy.js"