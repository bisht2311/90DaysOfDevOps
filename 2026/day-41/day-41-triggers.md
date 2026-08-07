# Day 41 – Triggers & Matrix Builds

## Challenge Tasks

### Task 1: Trigger on Pull Request
1. Create `.github/workflows/pr-check.yml`
2. Trigger it only when a pull request is **opened or updated** against `main`
3. Add a step that prints: `PR check running for branch: <branch name>`
4. Create a new branch, push a commit, and open a PR
5. Watch the workflow run automatically

**Verify:** Does it show up on the PR page?
   - Yes,it show up on the PR page

     ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/d3807d6019856d47cbde694ba3d94a4c0e0aa00a/2026/day-41/image/pr-check.png)

- [PR Check Workflow ](https://github.com/bisht2311/bisht2311-githubactions_practise/blob/2f330c214c03b8178df0b6d053ba6bbf424bbfaf/.github/workflows/pr_check.yml)

---

### Task 2: Scheduled Trigger
1. Add a `schedule:` trigger to any workflow using cron syntax
2. Set it to run every day at midnight UTC
3. What is the cron expression for every Monday at 9 AM?

- [Schedule Trigger](https://github.com/bisht2311/bisht2311-githubactions_practise/blob/2f330c214c03b8178df0b6d053ba6bbf424bbfaf/.github/workflows/schedule-trigger.yml) | cron expression for every Monday at 9 AM is `0 9 * * 1`

### Task 3: Manual Trigger
1. Create `.github/workflows/manual.yml` with a `workflow_dispatch:` trigger
2. Add an **input** that asks for an `environment` name (staging/production)
3. Print the input value in a step
4. Go to the **Actions** tab → find the workflow → click **Run workflow**

**Verify:** Can you trigger it manually and see your input printed?
   - Yes, I see input value.

      ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/d3807d6019856d47cbde694ba3d94a4c0e0aa00a/2026/day-41/image/manual1.png)


      ![images](https://github.com/bisht2311/90DaysOfDevOps/blob/d3807d6019856d47cbde694ba3d94a4c0e0aa00a/2026/day-41/image/manual2.png)


- [Manual Trigger](https://github.com/bisht2311/bisht2311-githubactions_practise/blob/2f330c214c03b8178df0b6d053ba6bbf424bbfaf/.github/workflows/manual.yml)

---

### Task 4: Matrix Builds
Create `.github/workflows/matrix.yml` that:
1. Uses a matrix strategy to run the same job across:
   - Python versions: `3.10`, `3.11`, `3.12`
2. Each job installs Python and prints the version
3. Watch all 3 run in parallel
4. Then extend the matrix to also include 3 operating systems — how many total jobs run now? |  Total 9 jobs ran

- [Matrix Build](https://github.com/bisht2311/bisht2311-githubactions_practise/blob/2f330c214c03b8178df0b6d053ba6bbf424bbfaf/.github/workflows/matrix.yml)

     ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/d3807d6019856d47cbde694ba3d94a4c0e0aa00a/2026/day-41/image/matrix1.png)
  
     ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/d3807d6019856d47cbde694ba3d94a4c0e0aa00a/2026/day-41/image/matrix2.png)


- [Extend Matrix](https://github.com/bisht2311/bisht2311-githubactions_practise/blob/2f330c214c03b8178df0b6d053ba6bbf424bbfaf/.github/workflows/python-os-matrix.yml)

     ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/d3807d6019856d47cbde694ba3d94a4c0e0aa00a/2026/day-41/image/extended-matrix1.png)
  
     ![image](https://github.com/bisht2311/90DaysOfDevOps/blob/d3807d6019856d47cbde694ba3d94a4c0e0aa00a/2026/day-41/image/extended-matrix2.png)

---

### Task 5: Exclude & Fail-Fast
1. In your matrix, **exclude** one specific combination (e.g., Python 3.10 on Windows)
2. Set `fail-fast: false` — trigger a failure in one job and observe what happens to the rest
3. Write in your notes: What does `fail-fast: true` (the default) do vs `false`?

- [FailFast](https://github.com/bisht2311/bisht2311-githubactions_practise/blob/2f330c214c03b8178df0b6d053ba6bbf424bbfaf/.github/workflows/python-os-matrix.yml)

  `fail-fast: true (default)`: If one job fails, the remaining matrix jobs are cancelled.

  `fail-fast: false`: If one job fails, the other jobs continue running until completion.

   

---
