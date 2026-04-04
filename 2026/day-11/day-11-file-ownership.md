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
3. Create group: sudo groupadd heist-team
4. Change file group to heist-team
5. Verify the change

## Task 4: Combined Owner & Group Change

Using chown you can change both owner and group together:

1. Create file project-config.yaml
2. Change owner to professor AND group to heist-team (one command)
3. Create directory app-logs/
4. Change its owner to berlin and group to heist-team

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
![()]
