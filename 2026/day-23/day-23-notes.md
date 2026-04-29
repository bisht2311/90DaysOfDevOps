# Day 23 – Git Branching & Working with GitHub

### Task 1: Understanding Branches
1. What is a branch in Git?
- A separate version of your code where you can make changes without affecting the main project.
  
2. Why do we use branches instead of committing everything to `main`?
- Branches let us work on new features or fixes safely without breaking `main` branch.

3. What is `HEAD` in Git?
- A pointer that tells Git which branch or commit you are currently working on.
  
4. What happens to your files when you switch branches?
- When you switch branches, Git changes your files to match that branch.
1. Some files may change or disappear
2. New files may appear
3. Your work may stop you from switching if it clashes with the other branch
---

### Task 2: Branching Commands — Hands-On

1. List all branches in your repo
- `git branch`

     ![gitb](https://github.com/bisht2311/90DaysOfDevOps/blob/147317162cb19a5b527e8af62b6b01d943701be4/2026/day-23/images/1-branch.png)

2. Create a new branch called `feature-1`
- `git branch feature-1`

3. Switch to `feature-1`
- `git switch feature-1`
     
     ![gitsb](https://github.com/bisht2311/90DaysOfDevOps/blob/147317162cb19a5b527e8af62b6b01d943701be4/2026/day-23/images/2-create-and-switch-feature-1.png)

4. Create a new branch and switch to it in a single command — call it `feature-2`
- `git checkout -b feature-2`

    ![gitsb](https://github.com/bisht2311/90DaysOfDevOps/blob/147317162cb19a5b527e8af62b6b01d943701be4/2026/day-23/images/4-create-switch-feature-2-checkout.png)


5. Try using `git switch` to move between branches — how is it different from `git checkout`?
- `git switch <branch>`   :only switches branches.  
- `git checkout <branch>` :switches branches and can also restore files.

    ![images](https://github.com/bisht2311/90DaysOfDevOps/blob/147317162cb19a5b527e8af62b6b01d943701be4/2026/day-23/images/5-switch-branches.png)

6. Make a commit on `feature-1` that does **not** exist on `main`
- `git commit -m "Add git branch command section to git-commands.md"`

  ![images](https://github.com/bisht2311/90DaysOfDevOps/blob/147317162cb19a5b527e8af62b6b01d943701be4/2026/day-23/images/6-1-make-commit-feature-1.png)
  ![images](https://github.com/bisht2311/90DaysOfDevOps/blob/147317162cb19a5b527e8af62b6b01d943701be4/2026/day-23/images/6-2-check-commit.png)

7. Switch back to `main` — verify that the commit from `feature-1` is not there

     ![images](https://github.com/bisht2311/90DaysOfDevOps/blob/147317162cb19a5b527e8af62b6b01d943701be4/2026/day-23/images/7-switch-to-maste-and-check-commit.png)

8. Delete a branch you no longer needed
- `git branch -d feature-2`

    ![images](https://github.com/bisht2311/90DaysOfDevOps/blob/147317162cb19a5b527e8af62b6b01d943701be4/2026/day-23/images/8-delete-unwanted-branch.png)

9. Add all branching commands to your `git-commands.md`
---

### Task 3: Push to GitHub
1. Create a **new repository** on GitHub (do NOT initialize it with a README)   
2. Connect your local `devops-git-practice` repo to the GitHub remote
3. Push your `main` branch to GitHub

    ![images](https://github.com/bisht2311/90DaysOfDevOps/blob/147317162cb19a5b527e8af62b6b01d943701be4/2026/day-23/images/9-push-to-main.png)

4. Push `feature-1` branch to GitHub

    ![images](https://github.com/bisht2311/90DaysOfDevOps/blob/147317162cb19a5b527e8af62b6b01d943701be4/2026/day-23/images/10-push-to-feature-1.png)


5. Verify both branches are visible on GitHub

    ![images](https://github.com/bisht2311/90DaysOfDevOps/blob/147317162cb19a5b527e8af62b6b01d943701be4/2026/day-23/images/11-github-repo.png)

6. What is the difference between `origin` and `upstream`?
- `origin`: origin is the default name for the repo you cloned,points to your own GitHub repository where you push and pull changes.
`example`: https://github.com/bisht2311/devops-git-practice.git
- `upstream`: upstream refers to the original repository you forked from.You use it to pull updates from the original project into your fork.
`example`: https://github.com/bisht2311/90DaysOfDevOps

---

### Task 4: Pull from GitHub

1. Make a change to a file **directly on GitHub** (use the GitHub editor)

    ![images](https://github.com/bisht2311/90DaysOfDevOps/blob/147317162cb19a5b527e8af62b6b01d943701be4/2026/day-23/images/12-gituhub-file-update-feature-1.png)

2. Pull that change to your local repo

    ![images](https://github.com/bisht2311/90DaysOfDevOps/blob/147317162cb19a5b527e8af62b6b01d943701be4/2026/day-23/images/13-pull-the-github-changes.png)

3. What is the difference between `git fetch` and `git pull`?
- `git fetch`: Downloads changes from remote only; does not change your branch,just updates remote info.
- `git pull` : Downloads changes from remote and merges them into your current branch, updating your local branch immediately.


### Task 5: Clone vs Fork
1. **Clone** any public repository from GitHub to your local machine

2. **Fork** the same repository on GitHub, then clone your fork
    
3. 1. What is the difference between clone and fork?

        - `clone` : Download the project from GitHub to my computer.
        - `fork` : Make my own copy of someone else’s project on GitHub.
   
   2. When would you clone vs fork?
   
        - `clone when`:
             - You are working on your own project.
             - You already have write access.
             - You just want the code locally.
            
        - `fork when`
             - You don’t have write access.
             - You want to contribute to open source.
             - You want your own safe copy.
   
             
   3. After forking, how do you keep your fork in sync with the original repo?
   
      After forking, you keep your fork updated by pulling changes from the original repo into your fork.
        - Simple steps:
        - Add the original repo as upstream (one-time setup)
        - Fetch latest changes from it
        - Merge those changes into your branch

     - In short: “Get updates from original → bring them into your fork.”
    
---
