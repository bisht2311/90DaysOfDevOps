I worked on a Linux User & Group Management challenge.

In real-world projects, multiple users access the same system, but not everyone should have identical permissions. Properly managing users, groups, and access rights is essential for maintaining both security and smooth collaboration.

🔹 What I worked on:
 • Created users: tokyo, berlin, professor
 • Created groups: developers, admins, project-team
 • Assigned users to groups based on their responsibilities
 • Configured a shared directory /opt/dev-project for developers
 • Applied 775 permissions to enable secure team collaboration
 • Created another workspace /opt/team-workspace for the project team
 • Verified access by creating test files from different user accounts

💡 Key Learnings:
 • gpasswd is very effective for managing group memberships
 • chmod and chgrp play a major role in enabling secure collaboration
 • Testing access with different users ensures permissions are set correctly
