# 🚀 GitHub Actions Capstone

A Flask-based DevOps project demonstrating:
- Reusable GitHub Actions workflows
- CI/CD pipeline (Build → Test → Docker → Deploy)
- Scheduled health checks

---
[![PR Pipeline Check](https://github.com/khirappawar1/github-actions-capstone/actions/workflows/Pr-pipeline.yml/badge.svg)](https://github.com/khirappawar1/github-actions-capstone/actions/workflows/Pr-pipeline.yml)

[![Main Pipeline](https://github.com/khirappawar1/github-actions-capstone/actions/workflows/main-pipeline.yml/badge.svg)](https://github.com/khirappawar1/github-actions-capstone/actions/workflows/main-pipeline.yml)



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