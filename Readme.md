Howto

# Startup the container
docker compose up --build -d

# run dev server
docker exec -it wordpress bash
cd bedrock/web/app/themes/sage
yarn dev

# Shutdown the container
docker compose down

# Reset all containers
docker system prune --all --volumes --force
