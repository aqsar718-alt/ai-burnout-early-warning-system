# Lumina Flow: AI Burnout Early-Warning System

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Flutter](https://img.shields.io/badge/Flutter-v3.10+-02569B?logo=flutter)
![Imagine Cup](https://img.shields.io/badge/Microsoft-Imagine%20Cup%202026-0078D4?logo=microsoft)

**Lumina Flow** is a mobile-first, AI-powered early-warning system designed to combat academic burnout among university students. Built for the **Microsoft Imagine Cup 2026**, it leverages Microsoft Azure's AI and Analytics ecosystem to provide students with actionable insights into their wellness and productivity.

## 🚀 Vision
Academic pressure can often lead to silent burnout. Lumina Flow acts as a personal wellness companion that monitors study patterns, sleep quality, and mood to predict burnout risk *before* it happens.

## ✨ Key Features
- **Microsoft Branded UI**: A professional, clean design inspired by Microsoft Fluent UI principles.
- **Dynamic Burnout Risk Meter**: Real-time circular progress indicator tailored to individual student data.
- **AI-Powered Insights**: Personalized recommendations generated via Azure OpenAI based on daily behavior.
- **Advanced Global Analytics**: Integration with Power BI Embedded for deep-dive trends (Workload vs. Sleep).
- **Daily Check-ins**: Frictionless mood and habit tracking via mobile-optimized selectors.

## 🛠️ Technology Stack
- **Frontend**: Flutter (Mobile-First, Material 3)
- **Backend**: FastAPI (Python)
- **AI/ML**: Azure OpenAI (Behavioral Analysis), Azure Machine Learning (Burnout Prediction)
- **Data Viz**: Power BI Embedded
- **Authentication**: Microsoft Entra ID (Mock)

## 📁 Project Structure
- `/frontend`: Flutter application source code.
- `/backend`: Python FastAPI service for AI/ML orchestration.
- `/docs`: Comprehensive documentation (Architecture, Prompts, ML Logic, Pitch Deck).

## 🏃 Getting Started

### Prerequisites
- Flutter SDK (v3.10 or higher)
- Python 3.9+

### Installation & Run

1. **Clone the repo**:
   ```bash
   git clone [REPLACE_WITH_YOUR_URL]
   cd falto_project
   ```

2. **Run Backend**:
   ```bash
   cd backend
   pip install -r requirements.txt
   python main.py
   ```

3. **Run Frontend**:
   ```bash
   cd frontend
   flutter run
   ```

## 📈 Future Roadmap
- Full integration with Microsoft Graph API for automated Outlook calendar analysis.
- Real-time notification system via Azure Notification Hubs.
- Institutional dashboard for university administrators to monitor campus-wide student wellness trends.

---
**Built with ❤️ for Microsoft Imagine Cup 2026.**
