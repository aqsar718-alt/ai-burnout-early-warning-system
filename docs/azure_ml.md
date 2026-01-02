# Azure Machine Learning Model Logic

## 1. Problem Definition
Predict a **Burnout Risk Score (0-100)** based on daily behavioral data. This is a regression problem.

## 2. Input Features (X)

| Feature | Type | Description |
| :--- | :--- | :--- |
| `sleep_hours` | Float | Hours of sleep in the last 24h. |
| `study_hours` | Float | Hours spent studying/working in the last 24h. |
| `screen_time` | Float | Total screen time (phone + laptop). |
| `social_interactions` | Integer | Number of meaningful social interactions (0-10+). |
| `physical_activity_mins` | Integer | Minutes of exercise. |
| `deadline_proximity` | Integer | Days until next major deadline (inverse weight). |
| `previous_burnout_score` | Float | The score from yesterday (temporal dependency). |
| `journal_sentiment` | Float | Sentiment score from Azure OpenAI (-1.0 to 1.0). |

## 3. Target Variable (Y)
**`burnout_risk_score`** (Continuous, 0 to 100).
- 0-30: Low Risk (Sustainable)
- 31-70: Medium Risk (Caution)
- 71-100: High Risk (Action Needed)

## 4. MVP Training Approach (Python/Scikit-Learn)

Since we may not have a massive labeled dataset for the MVP, we will use a **Synthetic Data Generator** based on psychological research heuristics to train the initial model (Simulated Annealing or Rule-based seeding).

**Algorithm:** Random Forest Regressor or XGBoost.
**Reason:** Handles non-linear relationships well (e.g., high study is fine *if* sleep is high, but bad if sleep is low).

## 5. Inference Logic (Pseudo-code)

```python
def predict_burnout(features):
    # Preprocessing
    features['sleep_deficit'] = 8 - features['sleep_hours']
    
    # Model Loading
    model = mlflow.sklearn.load_model("runs:/<run_id>/model")
    
    # Prediction
    score = model.predict([features])
    
    # Post-processing constraints
    score = max(0, min(100, score))
    
    return score
```

## 6. Model Explanation (Explainable AI)
We use SHAP (SHapley Additive exPlanations) values to tell the user *why* their score is high.
*Example output:* "Your risk increased by +15% today primarily because of 'Consecutive Low Sleep' (contribution: 0.8)."
