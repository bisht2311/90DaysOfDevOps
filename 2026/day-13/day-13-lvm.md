## Task 1: Check Current Storage

**Commands run:**
```bash
lsblk
pvs
vgs
lvs
df -h
```
**Observation:**
- No existing physical volumes, volume groups, or logical volumes
![](https://github.com/bisht2311/90DaysOfDevOps/blob/49f9aed95599a1babe6b02559f81b96bcaff297c/2026/day-13/Day%2013%20-%20Snapshots/1.0.png)
![](https://github.com/bisht2311/90DaysOfDevOps/blob/49f9aed95599a1babe6b02559f81b96bcaff297c/2026/day-13/Day%2013%20-%20Snapshots/1.1.png)
![](https://github.com/bisht2311/90DaysOfDevOps/blob/49f9aed95599a1babe6b02559f81b96bcaff297c/2026/day-13/Day%2013%20-%20Snapshots/1.3.png)

## Task 2: Create Physical Volume

**Command:**
```bash
pvcreate /dev/xvdf
pvcreate /dev/xvdg
pvcreate /dev/xvdh
pvs
```

**Observation:**
- `/dev/xvdf , /dev/xvdg and /dev/xvdh` initialized as a physical volume
- `pvs` shows it ready for LVM

![](https://github.com/bisht2311/90DaysOfDevOps/blob/b4ea6442acd000b9b6c53d42bb2860fd3defb355/2026/day-13/Day%2013%20-%20Snapshots/2.0.png)

## Task 3: Create Volume Group

**Command:**
```bash
vgcreate devops-vg /dev/xvdf /dev/xvdg
vgs
```

**Observation:**
- Volume group `devops-vg` created with 22G free space

![](https://github.com/bisht2311/90DaysOfDevOps/blob/ac20b8b1801dd73905f248fd73634a64682c4d25/2026/day-13/Day%2013%20-%20Snapshots/3.0.png)

## Task 4: Create Logical Volume

**Command:**
```bash
lvcreate -L 15G -n app-data devops-vg
lvs
```

**Observation:**
- Logical volume `app-data` of 15GB created under `devops-vg`

![task4](https://github.com/bisht2311/90DaysOfDevOps/blob/67eb45fd5184008209ddbe3355fb5860716c5904/2026/day-13/Day%2013%20-%20Snapshots/4.0.png)

## Task 5: Format and Mount Logical Volume

**Commands:**
```bash
mkfs.ext4 /dev/devops-vg/app-data
mkdir /mnt/app-data
mount /dev/devops-vg/app-data /mnt/app-data
lsblk
df -h
```

**Observation:**
- LV formatted as `ext4`
- Mounted at `/mnt/app-data`

![task5](https://github.com/bisht2311/90DaysOfDevOps/blob/67eb45fd5184008209ddbe3355fb5860716c5904/2026/day-13/Day%2013%20-%20Snapshots/5.0.png)

## Task 6: Extend Logical Volume

**Commands:**
```bash
lvextend -L +2G /dev/devops-vg/app-data
df -h
```
**Observation:**
- LV size increased by 2GB

![task6]()


## Commands Used

### 1. Check Current Storage
```bash
lsblk      # List all block devices and partitions
pvs        # Show existing physical volumes
vgs        # Show existing volume groups
lvs        # Show existing logical volumes
df -h      # Show mounted filesystems and their usage
```

### 2. Create Physical Volume
```bash
pvcreate /dev/xvdf       # Initialize /dev/xvdf as a physical volume for LVM
pvcreate /dev/xvdg       # Initialize /dev/xvdg as a physical volume for LVM
pvs                      # Verify physical volume creation
```

### 3. Create Volume Group
```bash
vgcreate devops-vg /dev/xvdf /dev/xvdg    # Create a volume group named devops-vg
vgs                                       # Verify volume group creation
```

### 4. Create Logical Volume
```bash
lvcreate -L 15G -n app-data devops-vg     # Create a logical volume named app-data with 15GB
lvs                                       # Verify logical volume creation
```

### 5. Format and Mount Logical Volume
```bash
mkfs.ext4 /dev/devops-vg/app-data               # Format LV with ext4 filesystem
mkdir -p /mnt/app-data                          # Create mount point
mount /dev/devops-vg/app-data /mnt/app-data     # Mount LV
df -h /mnt/app-data                             # Verify mounted filesystem size and usage
```

### 6. Extend Logical Volume
```bash
lvextend -L +2G /dev/devops-vg/app-data       # Extend LV by 2GB
df -h                                         # Verify updated size and usage
```

## Key Learnings

1. How to initialize a physical disk for LVM (`pvcreate`)  
2. How to create a volume group (`vgcreate`) and logical volume (`lvcreate`)  
3. How to extend a logical volume (`lvextend`)
