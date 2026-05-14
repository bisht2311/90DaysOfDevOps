# Day 30 – Docker Images & Container Lifecycle

## Challenge Tasks

### Task 1: Docker Images
1. Pull the `nginx`, `ubuntu`, and `alpine` images from Docker Hub

    ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/42dc7e41476d1fa014ffa5bf8d5f9250b102dee6/2026/day-30/images/pulling-image.png)


2. List all images on your machine

    ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/42dc7e41476d1fa014ffa5bf8d5f9250b102dee6/2026/day-30/images/list-images.png)


    | Image         | Disk Usage | Content Size |
    | ------------- | ---------- | ------------ |
    | alpine:latest | 13.1MB     | 3.95MB       |
    | nginx:latest  | 240MB      | 65.9MB       |
    | ubuntu:latest | 160MB      | 45.3MB       |

    **Disk usage(Local Size) is actual image size**

    **Content Size(Transfer Size) is amount of data used when pulling the inage over a network**



3. Compare `ubuntu` vs `alpine`

- `Ubuntu` is a full-featured Linux distribution, while `Alpine` is a minimal distribution optimized for containers. 


4. Inspect an image — what information can you see?

    ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/42dc7e41476d1fa014ffa5bf8d5f9250b102dee6/2026/day-30/images/inspect-image.png)


5. Remove an image you no longer need

    ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/42dc7e41476d1fa014ffa5bf8d5f9250b102dee6/2026/day-30/images/image-remove.png)

---

### Task 2: Image Layers
1. Run `docker image history nginx` — what do you see?

    ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/42dc7e41476d1fa014ffa5bf8d5f9250b102dee6/2026/day-30/images/image-history.png)


- A list of instructions used to build the image (e.g., CMD, EXPOSE, ENTRYPOINT, COPY, RUN, ENV, LABEL) Each instruction corresponds to a layer

2. Each line is a **layer**. Note how some layers show sizes and some show 0B

- Layers with a size (MB or kB) were created by instructions that modify the filesystem,such as RUN, COPY, or ADD.
- Layers showing 0B were created by instructions that only change metadata, such as ENV, CMD, EXPOSE, LABEL, or ENTRYPOINT.These do not change the filesystem.

3. What are layers and why does Docker use them?

- Docker layers are read-only filesystem snapshots created by each instruction in a Dockerfile.
- Docker uses layers because:
    - They allow build caching (faster builds)
    - They allow images to share
 common layers (saves storage).
    - They make image downloads faster (only new layers are pulled)

---

### Task 3: Container Lifecycle
Practice the full lifecycle on one container:
1. **create** a container (without starting it)
2. **start** the container
3. **pause** it and check status
4. **unpause** it
5. **stop** it
6. **restart** it
7. **kill** it
8. **remove** it
Check `docker ps -a` after each step — observe the state changes.

![image](https://github.com/bisht2311/90DaysOfDevOps/blob/42dc7e41476d1fa014ffa5bf8d5f9250b102dee6/2026/day-30/images/container-life_cycle.png)


---

### Task 4: Working with Running Containers
1. Run an Nginx container in detached mode
2. View its **logs**
3. View **real-time logs** (follow mode)

    ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/42dc7e41476d1fa014ffa5bf8d5f9250b102dee6/2026/day-30/images/container-logs.png)


4. **Exec** into the container and look around the filesystem

    ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/42dc7e41476d1fa014ffa5bf8d5f9250b102dee6/2026/day-30/images/container-filesystem.png)


5. Run a single command inside the container without entering it


    ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/42dc7e41476d1fa014ffa5bf8d5f9250b102dee6/2026/day-30/images/container-exec-single_command.png)



6. **Inspect** the container — find its IP address, port mappings, and mounts

    ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/42dc7e41476d1fa014ffa5bf8d5f9250b102dee6/2026/day-30/images/container-networks-ports.png)


    ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/42dc7e41476d1fa014ffa5bf8d5f9250b102dee6/2026/day-30/images/container-mounts.png)
   
---

### Task 5: Cleanup

1. Stop all running containers in one command
2. Remove all stopped containers in one command
3. Remove unused images

![image](https://github.com/bisht2311/90DaysOfDevOps/blob/42dc7e41476d1fa014ffa5bf8d5f9250b102dee6/2026/day-30/images/docker-prune.png)


---
