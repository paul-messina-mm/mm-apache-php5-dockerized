## Handling Changes and Updating the Xdashboard Deployment

1. Identify and Understand Changes
2. Update the Dockerfile (if applicable)
3. Rebuild the Docker Image
4. Push the Image to the Repository
5. Update Helm Chart (if applicable)
6. Deploy or Update the Application
7. Verify Deployment and Functionality
8. Document Changes and Versioning

Example


1. Identify and Understand Changes
 
 File "info2.php" added to www directory

 Update "appVersion" in Chart.yaml ?

 Update "version" in Chart.yaml ?

 Update "tag" in values.yaml ?

2. Update the Dockerfile (if applicable)

 not applicable as the www directory is already added at build

3. Rebuild the Docker Image

```
docker buildx build --platform linux/amd64 -t local_user/xdashboard:latest . --output type=docker
```

4. Tag and push the Image to the Repository

```
docker tag local_user/xdashboard:v0.1.0 docker.magicmemories.com/xdashboard:v0.1.0  # change tag

docker push docker.magicmemories.com/xdashboard:v0.1.0   # change tag
```


5. Update Helm Chart (if applicable)

```
helm upgrade my-xdashboard <chart-directory> -n xdashboard
```


6. Deploy or Update the Application

helm upgrade already does it?

7. Verify Deployment and Functionality

tests

8. Document Changes and Versioning

always, please
