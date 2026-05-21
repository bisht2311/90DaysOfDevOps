# Day 33 – Docker Compose: Multi-Container Basics

## Challenge Tasks

### Task 1: Install & Verify
1. Check if Docker Compose is available on your machine
2. Verify the version

    ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/a010126df85dc09f3aeaead8a0b453491fffb574/2026/day-33/images/version.png)

---

### Task 2: Your First Compose File
1. Create a folder `compose-basics`
2. Write a `docker-compose.yml` that runs a single **Nginx** container with port mapping
   
   - [Compose file](https://github.com/bisht2311/90DaysOfDevOps/blob/a010126df85dc09f3aeaead8a0b453491fffb574/2026/day-33/docker-compose.yml)
     
3. Start it with `docker compose up`
     
4. Access it in your browser
   
   ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/a010126df85dc09f3aeaead8a0b453491fffb574/2026/day-33/images/compose-up.png)
   
5. Stop it with `docker compose down`

   ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/a010126df85dc09f3aeaead8a0b453491fffb574/2026/day-33/images/compose-down.png)

---

### Task 3: Two-Container Setup
Write a `docker-compose.yml` that runs: 
  - A **WordPress** container
  - A **MySQL** container

They should:
  - Be on the same network (Compose does this automatically)
  - MySQL should have a named volume for data persistence
  - WordPress should connect to MySQL using the service name

  [Compose file](https://github.com/bisht2311/90DaysOfDevOps/blob/a010126df85dc09f3aeaead8a0b453491fffb574/2026/day-33/wordpress-mysql/docker-compose.yml)

Start it, access WordPress in your browser, and set it up.

  ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/a010126df85dc09f3aeaead8a0b453491fffb574/2026/day-33/images/wordpress-mysql.png)


**Verify:** Stop and restart with `docker compose down` and `docker compose up` — is your WordPress data still there?

  - Yes,wordpress data is there.

  ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/a010126df85dc09f3aeaead8a0b453491fffb574/2026/day-33/images/again-test.png)
    

---

### Task 4: Compose Commands

Practice and document these:

1. Start services in **detached mode**

      `docker compose up -d`
   
      ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/a010126df85dc09f3aeaead8a0b453491fffb574/2026/day-33/images/4.1.png)

3. View running services

      `docker compose ps`
   
      ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/a010126df85dc09f3aeaead8a0b453491fffb574/2026/day-33/images/4.2.png)

4. View **logs** of all services

      `docker compose logs db` && `docker compose logs wordpress`
   
      ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/a010126df85dc09f3aeaead8a0b453491fffb574/2026/day-33/images/4.3.png)

6. View logs of a **specific** service

      ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/a010126df85dc09f3aeaead8a0b453491fffb574/2026/day-33/images/4.4.png)

7. **Stop** services without removing

      `docker compose stop`
   
      ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/a010126df85dc09f3aeaead8a0b453491fffb574/2026/day-33/images/4.5.png)

8. **Remove** everything (containers, networks)

      `docker compose down`
   
      ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/a010126df85dc09f3aeaead8a0b453491fffb574/2026/day-33/images/4.6.png)

9. **Rebuild** images if you make a change

      `docker compose up --build.`

---

### Task 5: Environment Variables

1. Add environment variables directly in your `docker-compose.yml`
   
2. Create a `.env` file and reference variables from it in your compose file

      [Compose file](https://github.com/bisht2311/90DaysOfDevOps/blob/a010126df85dc09f3aeaead8a0b453491fffb574/2026/day-33/wordpress-mysql-env/docker-compose.yml)
   
3. Verify the variables are being picked up

    ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/a010126df85dc09f3aeaead8a0b453491fffb574/2026/day-33/images/env_verified.png)

    
        
