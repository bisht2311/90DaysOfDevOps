# Day 36 – Docker Project: Dockerize a Full Application
---

## Challenge Tasks

### Task 1: App
- A **Python Flask** app with a database

    [App](https://github.com/bisht2311/90DaysOfDevOps/tree/5b18b727bf5307cd7a677551536c950288c64e78/2026/day-36/app)
---

### Task 2: Write the Dockerfile
1. Create a Dockerfile for your application
2. Use a **multi-stage build** if applicable
3. Use a **non-root user**
4. Keep the image **small** — use alpine or slim base images
5. Add a `.dockerignore` file

- Build and test it locally --- its working!

    [Dockerfile](https://github.com/bisht2311/90DaysOfDevOps/blob/5b18b727bf5307cd7a677551536c950288c64e78/2026/day-36/app/Dockerfile)

 
 ---

### Task 3: Add Docker Compose
Write a `docker-compose.yml` that includes:
1. Your **app** service (built from Dockerfile)
2. A **database** service (Postgres, MySQL, MongoDB — whatever your app needs)
3. **Volumes** for database persistence
4. A **custom network**
5. **Environment variables** for configuration (use `.env` file)
6. **Healthchecks** on the database

  - Run `docker compose up` and verify everything works together.

    [Docker Compose](https://github.com/bisht2311/90DaysOfDevOps/blob/5b18b727bf5307cd7a677551536c950288c64e78/2026/day-36/app/docker-compose.yml)


---

### Task 4: Ship It
1. Tag your app image
2. Push it to Docker Hub
3. Share the Docker Hub link
4. Write a `README.md` in your project with: [Project README](https://github.com/bisht2311/90DaysOfDevOps/blob/5b18b727bf5307cd7a677551536c950288c64e78/2026/day-36/app/README.md)
   - What the app does
   - How to run it with Docker Compose
   - Any environment variables needed

- Tag & Push
   ![Tag & Push](https://github.com/bisht2311/90DaysOfDevOps/blob/5b18b727bf5307cd7a677551536c950288c64e78/2026/day-36/images/docker-push.png)

- DockerHub
   ![DockerHub](https://github.com/bisht2311/90DaysOfDevOps/blob/5b18b727bf5307cd7a677551536c950288c64e78/2026/day-36/images/dockerhub.png)
---

### Task 5: Test the Whole Flow
1. Remove all local images and containers
2. Pull from Docker Hub and run using only your compose file
3. Does it work fresh? If not — fix it until it does
  - Yes it work fresh
    - Working App
    ![Working App](https://github.com/bisht2311/90DaysOfDevOps/blob/5b18b727bf5307cd7a677551536c950288c64e78/2026/day-36/images/app-working.png)


---

## Summary
- Final image size: 55.86 MB
- **Doceker Hub Link** : https://hub.docker.com/repository/docker/bisht2311/notes-app
- Project README.md: [Project README](https://github.com/bisht2311/90DaysOfDevOps/blob/5b18b727bf5307cd7a677551536c950288c64e78/2026/day-36/app/README.md)

---
