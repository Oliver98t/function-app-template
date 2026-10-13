pulumi up -y
cd src
func azure functionapp publish "$(pulumi stack output function_app_name)" \
  --python \
  --build remote
cd ..