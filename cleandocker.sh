``bash
#!/bin/bash

# Remove unused Docker images
echo "Removing unused Docker images..."
docker image prune -a --force || echo "Error: Failed to remove unused Docker images."
echo ""--------------------------------""

# Remove unused Docker networks
echo "Removing unused Docker networks..."
docker network prune --force || echo "Error: Failed to remove unused Docker networks."
echo ""--------------------------------""

# Remove unused Docker volumes
echo "Removing unused Docker volumes..."
docker volume prune --force || echo "Error: Failed to remove unused Docker volumes."
echo ""--------------------------------""

echo "Docker cleanup completed!"
```
