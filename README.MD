# 🚀 GitHub Actions Capstone

A Flask-based DevOps project demonstrating:
- Reusable GitHub Actions workflows
- CI/CD pipeline (Build → Test → Docker → Deploy)
- Scheduled health checks

---
[![PR Pipeline Check](https://github.com/khirappawar1/github-actions-capstone/actions/workflows/Pr-pipeline.yml/badge.svg)](https://github.com/khirappawar1/github-actions-capstone/actions/workflows/Pr-pipeline.yml)

[![Main Pipeline](https://github.com/khirappawar1/github-actions-capstone/actions/workflows/main-pipeline.yml/badge.svg)](https://github.com/khirappawar1/github-actions-capstone/actions/workflows/main-pipeline.yml)

[![Health Check](https://github.com/khirappawar1/github-actions-capstone/actions/workflows/health-check.yml/badge.svg)](https://github.com/khirappawar1/github-actions-capstone/actions/workflows/health-check.yml)

## Pipeline Architecture Diagram

                ┌────────────────────┐
                │   Pull Request     │
                └─────────┬──────────┘
                          │
                          ▼
                ┌────────────────────┐
                │  Build & Test      │
                └─────────┬──────────┘
                          │
                          ▼
                ┌────────────────────┐
                │  PR Checks Pass    │
                └────────────────────┘


                ┌────────────────────┐
                │   Merge to Main    │
                └─────────┬──────────┘
                          │
                          ▼
                ┌────────────────────┐
                │  Build & Test      │
                └─────────┬──────────┘
                          │
                          ▼
                ┌────────────────────┐
                │ Docker Build & Push│
                └─────────┬──────────┘
                          │
                          ▼
                ┌────────────────────┐
                │     Deploy         │
                └────────────────────┘


        ┌──────────────────────────────────────┐
        │   Scheduled (Every 12 hours)         │
        └──────────────────────────────────────┘
                          │
                          ▼
                ┌────────────────────┐
                │  Health Check      │
                └────────────────────┘

## 📦 Features

- Flask app with `/health` endpoint
- Dockerized application
- Reusable workflows
- PR validation pipeline
- Production deployment simulation
- Scheduled health monitoring


## 🧪 Endpoints

- `/` → App status  
- `/health` → Health check (`{"status":"ok"}`)

---