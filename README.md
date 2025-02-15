# Gateway

The Gateway project enables secure, isolated container communication by leveraging a dedicated Docker network. This guide explains the purpose of the project and provides instructions for setup and execution.

## Project Insights

- **Purpose:**  
  Serve as the central communication hub between multiple microservices, ensuring security and isolation.

- **Docker Network:**  
  A custom Docker network named "web" is maintained to avoid conflicts and enhance security. This network is automatically created if it does not exist.

## How to Get Started

1. **Running the Script:**  
   Execute the provided run.sh script to set up the Docker network and start your containers:
   ```sh
   ./run.sh
   ```

2. **Automation Details:**  
   - The script checks for a pre-existing "web" network.
   - It creates the network only when necessary, streamlining container launches with Docker Compose.

3. **Network Configuration for Services**

    In each docker-compose file—both for the frontend and backend—ensure you add the appropriate Traefik labels. These labels define routing rules and entrypoints so that Traefik can automatically detect and route incoming requests to the correct service.

    For example, in your docker-compose file, you might add labels like these:

    For the Frontend service:
    ```yaml
    services:
      frontend:
        image: your-frontend-image
        ports:
          - "80:80"
        labels:
          - "traefik.enable=true"
          - "traefik.http.routers.frontend.rule=Host(`frontend.example.com`)"
          - "traefik.http.routers.frontend.entrypoints=web"
    ```

    For the Backend service:
    ```yaml
    services:
      backend:
        image: your-backend-image
        labels:
          - "traefik.enable=true"
          - "traefik.http.routers.backend.rule=Host(`api.example.com`)"
          - "traefik.http.routers.backend.entrypoints=web"
    ```

    These examples ensure each service is properly registered with Traefik through:
    - Enabling Traefik for the service.
    - Defining a routing rule that directs traffic based on the host header.
    - Specifying the Traefik entrypoint (e.g., web).

    Adjust the labels and rules according to your specific environment and domain configuration.

## Benefits

- **Simplified Environment Setup:**  
  Quick initiation and operation of your microservices environment.
  
- **Isolation and Security:**  
  Dedicated networking minimizes risks and potential conflicts between services.

Adopt this approach to maintain clear, efficient, and isolated communication channels in your microservices architecture.

