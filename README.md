# flask-helm<br />

#Local Run<br />
In order to run the project locally:<br />
- create a virtual env & run on it
- install requirements `pip install -r requirements.txt`
- run `python -m flask run` from the project directory

#Container<br />
In order to build, tag & push an image run the following commands:<br />
`docker image build -t <tag> .` (build)
`docker tag <tag> <repo-name>:<tag-name>` (tag)
`docker push <repo-name>:<tag-name>` (push)

If you want to run the container locally:<br />
`docker run -d -p 5000:5000 <tag>`<br />
and test the following url - `localhost:5000/healthy`<br />
or `localhost:5000/get_variable/<any_env_var>`<br />

#Helm<br />
Orders for helm deployment to kubernetes:
- When building the project for the first time run:<br />
  `helm install --set image.tag=<tag-name>  <helm-release-name> helm/envVarChart`
- In order to deploy changes run:<br />
  `helm upgrade --set image.tag=<tag-name>  <helm-release-name> helm/envVarChart`
- In order to uninstall the release from kubernetes:<br />
  `helm install <helm-release-name>`
