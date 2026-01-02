# System Architecture: AI Burnout Early-Warning System

## 1. End-to-End Architecture Overview

The system is designed as a **mobile-first, cloud-native solution** leveraging the Microsoft Azure ecosystem to ensure scalability, security, and AI-driven insights.

### High-Level Components:
- **Frontend (Mobile)**: Built with **Flutter** (Material 3 Design). It serves as the primary touchpoint for students to log daily moods, view burnout risks, and receive AI interventions.
- **Backend (API Layer)**: Built with **FastAPI** (Python), hosted on **Azure App Service**. It acts as the orchestrator between the mobile app, database, and AI services.
- **Data Storage**: **Azure Cosmos DB** (NoSQL) is used for storing flexible user logs, check-ins, and chat history. **Azure SQL** can be used if structured relational data is preferred, but Cosmos DB fits the JSON document nature of logs better.
- **AI & ML Layer**:
  - **Azure OpenAI Service (GPT-4o-mini)**: Processes text-based user journals and generates personalized, empathetic, non-medical recommendations.
  - **Azure Machine Learning**: Hosts the predictive model (Random Forest / XGBoost) to calculate a "Burnout Risk Score" (0-100) based on numerical patterns (sleep, study hours, social activity).
- **Integration**: **Microsoft Graph API** fetches calendar data to analyze schedule density (a key burnout factor).
- **Analytics**: **Power BI Embedded** visualizes data for institutional admins (anonymized trends).

---

## 2. Text-Based Data Flow Diagram

```text
[Student User] 
      |
      v
[Flutter Mobile App]
      | (HTTPS/REST)
      v
[Azure API Management / Load Balancer] -> [FastAPI Backend (Azure App Service)]
      |
      +---> 1. Auth & Profile Data <-----> [Azure Cosmos DB / SQL]
      |
      +---> 2. Fetch Schedule <----------> [Microsoft Graph API]
      |
      +---> 3. Analyze Behavior <--------> [Azure OpenAI Service (GPT-4o)]
      |       (Text Logs -> Sentiment/Tone)
      |
      +---> 4. Predict Risk <------------> [Azure Machine Learning Endpoint]
              (Numerical Data -> Score)
      |
      +---> 5. Store Analytics Data -----> [Azure Cosmos DB]
                                              |
                                              v
                                     [Power BI Dashboard] (For Admins)
```

---

## 3. Microsoft Technology Stack Justification

| component | Technology | Why we chose it for Imagine Cup |
| :--- | :--- | :--- |
| **Frontend** | **Flutter** | Cross-platform (iOS/Android) from one codebase, highly performant, and Material 3 design ensures a premium feel. |
| **Backend** | **FastAPI (Python)** | High performance, native async support for AI calls, and auto-generated Swagger docs for easy testing. |
| **Hosting** | **Azure App Service** | PaaS offering that is easy to deploy, scales automatically, and integrates natively with other Azure services. |
| **GenAI** | **Azure OpenAI (GPT-4o)** | Enterprise-grade security for sensitive student data, low latency, and superior reasoning for "empathetic" advice. |
| **ML** | **Azure Machine Learning** | MLOps lifecycle management, auto-scaling inference endpoints, and easy integration of Python-based models. |
| **Data** | **Microsoft Graph API** | unique value prop: accessing real student schedules (Outlook/Teams) to correlate workload with burnout. |
| **Analytics** | **Power BI Embedded** | Industry standard for visualization; allows institutions to see macro-level burnout trends without handling raw data. |
