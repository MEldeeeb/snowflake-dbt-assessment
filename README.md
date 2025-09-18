# DBT Project Setup Guide

This document explains how to set up a Python virtual environment, clone this repository, and run the dbt project.

---

##  Step 1: Create a Virtual Environment

Navigate to the folder where you want to keep the project and create a virtual environment.

```bash
# Go to your projects directory
cd ~/DBT_Projects

# Create a virtual environment named venv_dbt
python3 -m venv venv_dbt

#Activate the virtual environment:

#Linux / macOS
source venv_dbt/bin/activate

# Windows (PowerShell)
venv_dbt\Scripts\activate

```
You should see (venv_dbt) at the start of your terminal prompt make sure that venv_dbt is active before next step.





## Step 2: Install dbt Core + Adapters

You can install dbt **core** plus specific adapters as separate packages:

```bash
# Install dbt core
pip install dbt-core

# Install dbt for Snowflake
pip install dbt-snowflake
```

## Step 3: Clone the Repository

```bash
git clone https://github.com/MEldeeeb/snowflake-dbt-assessment.git
cd snowflake-dbt-assessment
```




## Step 4: Configure Your dbt Profile

Navigate to the `~/.dbt/` directory:

```bash
cd ~/.dbt
```

Open or create `profiles.yml` in the `~/.dbt/` directory and configure your Snowflake connection:

```yaml
snowflake_tpch_demo:
  outputs:
    dev:
      account: JYNZTUJ-EH15396
      user: your_user_name
      password: <your_password_here>
      role: ACCOUNTADMIN
      database: tpch_db
      warehouse: DEV_WH
      schema: dev
      threads: 4
      type: snowflake
  target: dev
  ```




## Step 5: Verify dbt Setup

After installing dbt and configuring your `profiles.yml`, you can run:

```bash
dbt debug
```
If everything is configured correctly, you should see All checks passed!.



## Step 6: Run the Project

Install project dependencies (packages defined in `packages.yml`, if any):

```bash

# Run models:
dbt run

# Run tests:
dbt test

# Generate and view documentation:
dbt docs generate
dbt docs serve
```
a local web server is launched and you can view the docs in your browser.



# DBT_Projects Folder Structure

### Folder `DBT_Projects` contains the following sub-folders

- **venv_dbt/**: Python virtual environment containing dbt and dependencies  
- **snowflake-dbt-assessment/**: DBT project files which contains all `models`, `tests`, `macros`, `docs`, `snapshots`, `seeds` and `etc...`
