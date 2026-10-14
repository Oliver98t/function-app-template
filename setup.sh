PROJECT_NAME=$(basename "$PWD")
sed -i "s/function-app-template/$PROJECT_NAME/g" infrastructure/Pulumi.yaml
sed -i "s/function-app-template/$PROJECT_NAME/g" pyproject.toml
cd infrastructure
pulumi stack init dev
pulumi up -y
cd ..
uv sync --refresh --upgrade
