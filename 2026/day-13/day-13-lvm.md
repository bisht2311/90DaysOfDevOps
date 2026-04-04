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

![task4]()
