# configure pulumi and uv projects 
PROJECT_NAME=$(basename "$PWD")
sed -i "s/function-app-template/$PROJECT_NAME/g" infrastructure/Pulumi.yaml
sed -i "s/function-app-template/$PROJECT_NAME/g" pyproject.toml
# configure and deploy pulumi project
cd infrastructure
pulumi stack init dev
pulumi up -y
function_app_name=$(pulumi stack output function_app_name)
cd ..
uv sync --refresh --upgrade
# deploy function app code
cd source
sleep 3
func azure functionapp publish "$function_app_name" \
  --python \
  --build remote
cd .. 
