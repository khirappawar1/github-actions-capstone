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

                          ┌────────────────────────────┐
                          │     Developer Push Code    │
                          │   (feature/test-workflow)  │
                          └────────────┬───────────────┘
                                       │
                                       ▼
                          ┌────────────────────────────┐
                          │     Pull Request (PR)      │
                          │     → main branch          │
                          └────────────┬───────────────┘
                                       │
                                       ▼
                    ┌──────────────────────────────────────┐
                    │     PR Pipeline (CI Validation)      │
                    │--------------------------------------│
                    │ 1. Checkout Code                     │
                    │ 2. Setup Python (Reusable WF)        │
                    │ 3. Install Dependencies              │
                    │ 4. Run Tests                         │
                    │ 5. PR Summary (PASS/FAIL)            │
                    └────────────┬─────────────────────────┘
                                 │
                      ✅ If tests pass
                                 │
                                 ▼
                          ┌────────────────────────────┐
                          │        Merge to Main       │
                          └────────────┬───────────────┘
                                       │
                                       ▼
              ┌────────────────────────────────────────────┐
              │         Main Pipeline (CI/CD Flow)         │
              │--------------------------------------------│
              │                                            │
              │ 1️⃣ Build & Test (Reusable WF)              │
              │--------------------------------------------│
              │ - Checkout Code                            │
              │ - Setup Python                             │
              │ - Install Dependencies                     │
              │ - Run Tests                                │
              │                                            │
              │ 2️⃣ Docker Build & Push                    │
              │--------------------------------------------│
              │ - Build Docker Image                       │
              │ - Tag (latest + sha-commit)                │
              │ - Push to Docker Hub                       │
              │                                            │
              │ 3️⃣ Security Scan (DevSecOps) 🔐           │
              │--------------------------------------------│
              │ - Scan image using Trivy                   │
              │ - Detect vulnerabilities                   │
              │ - ❌ Fail if CRITICAL CVE found            │
              │ - 📄 Upload report as artifact             │
              │                                            │
              │ 4️⃣ Deploy 🚀                              │
              │--------------------------------------------│
              │ - Manual approval (Environment: prod)      │
              │ - Deploy Docker Image                      │
              │                                            │
              └────────────┬───────────────────────────────┘
                           │
                           ▼
                 ┌────────────────────────────┐
                 │     Production System      │
                 │   (Running Container)      │
                 └────────────┬───────────────┘
                              │
                              ▼
     ┌──────────────────────────────────────────────────────────┐
     │           Scheduled Health Check (Monitoring)            │
     │----------------------------------------------------------│
     │ Trigger: Every 12 hours (cron)                           │
     │                                                          │
     │ - Pull latest Docker image                               │
     │ - Run container                                          │
     │ - Call /health endpoint                                  │
     │ - Validate response (200 OK)                             │
     │ - Generate report (GITHUB_STEP_SUMMARY)                  │
     │ - Stop & remove container                                │
     └──────────────────────────────────────────────────────────┘


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