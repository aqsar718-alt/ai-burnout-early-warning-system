import os
import random
from typing import Optional, List
from fastapi import FastAPI, HTTPException, status
from pydantic import BaseModel
from datetime import datetime

app = FastAPI(
    title="AI Burnout Early-Warning System API",
    description="Backend for Microsoft Imagine Cup Project",
    version="1.0.0"
)

# --- MODELS ---

class UserLogin(BaseModel):
    email: str
    password: str

class DailyCheckIn(BaseModel):
    user_id: str
    sleep_hours: float
    study_hours: float
    mood_score: int # 1-10
    journal_text: Optional[str] = None

class BurnoutResponse(BaseModel):
    risk_score: int # 0-100
    risk_level: str # Low, Medium, High
    suggestion: str

class Insight(BaseModel):
    title: str
    description: str

# --- MOCK DATABASE & AI SERVICES ---

def calculate_burnout_risk(check_in: DailyCheckIn) -> int:
    """
    Mock ML Model Logic.
    In production, this would call an Azure ML endpoint.
    """
    base_risk = 50
    
    # Simple heuristics for MVP
    if check_in.sleep_hours < 5:
        base_risk += 20
    elif check_in.sleep_hours > 7:
        base_risk -= 10
        
    if check_in.study_hours > 8:
        base_risk += 15
        
    if check_in.mood_score < 4:
        base_risk += 15
        
    # Clamp between 0-100
    return max(0, min(100, base_risk))

def get_ai_suggestion(risk_score: int, journal_text: str) -> str:
    """
    Mock Azure OpenAI Logic.
    In production, this would call openai.ChatCompletion with GPT-4o.
    """
    if risk_score > 70:
        return "Your risk is high. We detected signs of exhaustion. Please stop studying immediately and take a 30-minute walk."
    elif risk_score > 30:
        return "You're doing okay, but watch your sleep schedule. Try to wind down by 11 PM."
    else:
        return "Great balance! Keep maintaining this sustainable pace."

# --- ENDPOINTS ---

@app.get("/")
def read_root():
    return {"message": "AI Burnout System Backend is Running"}

@app.post("/auth/login")
def login(user: UserLogin):
    # Mock Auth
    if user.email == "student@test.com" and user.password == "password":
        return {"token": "mock-jwt-token-123", "user_id": "user_001", "name": "Alex"}
    raise HTTPException(status_code=401, detail="Invalid credentials")

@app.post("/checkin", response_model=BurnoutResponse)
def submit_checkin(check_in: DailyCheckIn):
    # 1. Save to DB (Skipped for MVP Mock)
    
    # 2. Calculate Risk
    risk_score = calculate_burnout_risk(check_in)
    
    # 3. Determine Level
    level = "Low"
    if risk_score > 70:
        level = "High"
    elif risk_score > 30:
        level = "Medium"
        
    # 4. Get AI Suggestion
    suggestion = get_ai_suggestion(risk_score, check_in.journal_text or "")
    
    return BurnoutResponse(
        risk_score=risk_score,
        risk_level=level,
        suggestion=suggestion
    )

@app.get("/insights/{user_id}", response_model=List[Insight])
def get_insights(user_id: str):
    return [
        Insight(title="Sleep Pattern", description="You average 5.5 hours/night. Aim for 7."),
        Insight(title="Peak Productivity", description="You are most focused between 10 AM and 2 PM.")
    ]

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
