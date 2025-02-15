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

## Benefits

- **Simplified Environment Setup:**  
  Quick initiation and operation of your microservices environment.
  
- **Isolation and Security:**  
  Dedicated networking minimizes risks and potential conflicts between services.

Adopt this approach to maintain clear, efficient, and isolated communication channels in your microservices architecture.

