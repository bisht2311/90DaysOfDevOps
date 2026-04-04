## Task 1: Understanding Ownership

1. Run ls -l in your home directory
2. Identify the **owner** and **group** columns
3. Check who owns your files

**Format:** `-rw-r--r-- 1` owner group size date filename

### Difference Between Owner and Group
**Owner →** The main user who created or owns the file **||** 
**Group →** A set of users who may share access to the file

## Task 2: Basic chown Operations

1. Create file devops-file.txt
2. Check current owner: ls -l devops-file.txt
3. Change owner to tokyo (create user if needed)
4. Change owner to berlin
5. Verify the changes

## Task 3: Basic chgrp Operations

1. Create file team-notes.txt
2. Check current group: ls -l team-notes.txt
3. Create group: sudo groupadd heist-game
4. Change file group to heist-game
5. Verify the change

## Task 4: Combined Owner & Group Change

Using chown you can change both owner and group together:

1. Create file project-config.yaml
2. Change owner to professor AND group to heist-game (one command)
3. Create directory app-logs/
4. Change its owner to berlin and group to heist-game

## Task 5: Recursive Ownership

1. Create directory structure:
   ```
   mkdir -p heist-project/vault
   mkdir -p heist-project/plans
   touch heist-project/vault/gold.txt
   touch heist-project/plans/strategy.conf
  
   ```
2. Create group `planners`: `sudo groupadd planners
3. Change ownership of entire `heist-project/` directory:
   - Owner: `professor`
   - Group: `planners`
   - Use recursive flag (`-R`)
4. Verify all files and subdirectories changed: `ls -lR heist-project/`

## Task 6: Practice Challenge

1. Create users: `tokyo`, `berlin`, `nairobi` (if not already created)
2. Create groups: `vault-team`, `tech-team`
3. Create directory: `bank-heist/`
4. Create 3 files inside:
   ```
   touch bank-heist/access-codes.txt
   touch bank-heist/blueprints.pdf
   touch bank-heist/escape-plan.txt
   ```
5. Set different ownership:
   - `access-codes.txt` → owner: `tokyo`, group: `vault-team`
   - `blueprints.pdf` → owner: `berlin`, group: `tech-team`
   - `escape-plan.txt` → owner: `nairobi`, group: `vault-team`

## Sanpshots:

- Task 1 + Task 2
![](https://github.com/bisht2311/90DaysOfDevOps/blob/87591a067d176dfd3b661162f3a5d7e639ae7103/2026/day-11/Day11%20-%20Snapshots/1.png)

- Task 3 + Task 4
![](https://github.com/bisht2311/90DaysOfDevOps/blob/df98c85f4440b19f677197c3ba29aadc4513d1ca/2026/day-11/Day11%20-%20Snapshots/2.png)

- Task 5
![](https://github.com/bisht2311/90DaysOfDevOps/blob/0bf68f800f54f0014d814acce1b86ccb791a3444/2026/day-11/Day11%20-%20Snapshots/3.png)

- Task 6
![](https://github.com/bisht2311/90DaysOfDevOps/blob/3dfdacfb795d422de4d29fbc603cfc4c83939422/2026/day-11/Day11%20-%20Snapshots/4.png)

## Files & Directories Created
```bash
- devops-file.txt
- team-notes.txt
- project-config.yaml
- app-logs/
- heist-project/
  - vault/
    - gold.txt
  - plans/
    - strategy.conf
- bank-heist/
  - access-codes.txt
  - blueprints.pdf
  - escape-plan.txt
```

## Ownership Changes
| File/Dir                   | Before    | After                       |
| -------------------------- | --------- | --------------------------- |
| devops-file.txt            | user:user | tokyo:tokyo → berlin:berlin |
| team-notes.txt             | user:user | user:heist-team             |
| project-config.yaml        | user:user | professor:heist-team        |
| app-logs/                  | user:user | berlin:heist-team           |
| heist-project/ (all files) | user:user | professor:planners          |
| access-codes.txt           | user:user | tokyo:vault-team            |
| blueprints.pdf             | user:user | berlin:tech-team            |
| escape-plan.txt            | user:user | nairobi:vault-team          |


## Commands Used
```bash
touch devops-file.txt
ls -l
sudo useradd tokyo
sudo chown tokyo devops-file.txt
sudo useradd berlin
sudo chown berlin devops-file.txt
touch team-notes.txt
sudo groupadd heist-team
sudo chgrp heist-team team-notes.txt
touch project-config.yaml
sudo chown professor:heist-team project-config.yaml
mkdir app-logs
sudo chown berlin:heist-team app-logs
mkdir -p heist-project/vault
mkdir -p heist-project/plans
touch heist-project/vault/gold.txt
touch heist-project/plans/strategy.conf
sudo groupadd planners
sudo chown -R professor:planners heist-project/
mkdir bank-heist
touch bank-heist/access-codes.txt
touch bank-heist/blueprints.pdf
touch bank-heist/escape-plan.txt
sudo useradd nairobi
sudo groupadd vault-team
sudo groupadd tech-team
sudo chown tokyo:vault-team bank-heist/access-codes.txt
sudo chown berlin:tech-team bank-heist/blueprints.pdf
sudo chown nairobi:vault-team bank-heist/escape-plan.txt
ls -lR bank-heist/
```

## What I Learned
- **Owner** controls the file, and has specific rights (read/write/execute).
- **Group** allows multiple users to share permissions.
- **chgrp** changes group
- **chown** changes both owner and group in one command.
