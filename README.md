# flask-helm

#Local Run
In order to run the project locally:
- create a virtual env & run on it
- install requirements `pip install -r requirements.txt`
- run `python -m flask run` from the project directory

#Container
In order to build, tag & push an image run the following commands: 
`docker image build -t env_vars .` (build)
`docker tag env_vars <repo-name>:<tag-name>` (tag)
`docker push <repo-name>:<tag-name>` (push)

If you want to run the container locally:
`docker run -d -p 5000:5000 env_vars` 
and test the following url - `localhost:5000/healthy`
or `localhost:5000/get_variable/<any_env_var>`

#Helm
Orders for helm deployment to kubernetes:
- When building the project for the first time run:
  `helm install --set image.tag=<tag-name>  <helm-release-name> helm/envVarChart`
- In order to deploy changes run:
  `helm upgrade --set image.tag=<tag-name>  <helm-release-name> helm/envVarChart`
- In order to uninstall the release from kubernetes:
  `helm install <helm-release-name>`