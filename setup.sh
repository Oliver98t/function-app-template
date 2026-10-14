uv sync --refresh --upgrade
PROJECT_NAME="function-app-template"
sed -i "s/function-app-template/$PROJECT_NAME/g" infrastructure/Pulumi.yaml
sed -i "s/function-app-template/$PROJECT_NAME/g" pyproject.toml