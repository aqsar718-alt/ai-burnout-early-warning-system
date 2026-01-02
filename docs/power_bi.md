# Power BI Dashboard: Institutional Analytics

## Target Audience
University Administrators, Student Counselors, Academic Advisors.

## Dashboard Overview
The dashboard provides an aggregated, anonymized view of student well-being to help institutions allocate resources effectively (e.g., scheduling workshops during high-stress weeks).

## Key Performance Indicators (KPIs)
1.  **Average Burnout Risk Score**: Current campus-wide average.
2.  **High-Risk Student %**: Percentage of students in the "Red" zone (>70 risk).
3.  **Sleep Deficit Trend**: Average sleep hours vs. recommended baseline.
4.  **Engagement Index**: Correlation between LMS login frequency and burnout levels.

## Visualizations

### 1. The "Burnout Heatmap" (Calendar View)
*   **X-Axis**: Weeks of the Semester (Week 1 - Week 16).
*   **Y-Axis**: Departments (Engineering, Arts, Medicine).
*   **Insight**: Identifies specific weeks where stress spikes (e.g., Midterms) for specific departments.

### 2. Risk Distribution (Donut Chart)
*   Green (Sustainable): 60%
*   Yellow (Warning): 30%
*   Red (Critical): 10%

### 3. Driver Analysis (Bar Chart)
*   "Top Factors Contributing to Burnout this Week"
    *   1. Sleep Deprivation
    *   2. Deadline Clustering
    *   3. Low Physical Activity

## Data Privacy
- All data is **aggregated**.
- No individual student names are visible unless the student explicitly opts-in for direct counselor intervention.
- Row-level security (RLS) ensures Department Heads only see their own department's data.
