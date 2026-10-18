# Databricks-DBT Marketing Ads Project

## Overview
This project uses dbt (data build tool) and Databricks to transform and model marketing advertising data from Facebook Ads and Snapchat Ads.

The project implements a staging layer that prepares raw advertising data for reliable downstream analytics and reporting.

## Technologies
- **Databricks** — data platform for storing and processing data
- **dbt** — SQL-based data transformation, testing, and documentation
- **SQL** — data cleaning and modelling
- **Git and GitHub** — version control and collaboration

## Project Structure

```text
models/
└── staging/
    ├── facebook/
    └── snapchat/
```

Each platform has staging models and YAML configuration files for model documentation and data quality tests.

## Data Quality
The project uses dbt tests such as `not_null` and `unique` to validate key fields and improve data reliability.

## Running the Project
After configuring your Databricks connection and dbt profile, run:

```bash
uv run dbt debug
uv run dbt parse
uv run dbt build
```

**Note:** Connection credentials should be supplied through environment variables and must not be committed to version control.
