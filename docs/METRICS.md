HEART Framework: https://docs.google.com/presentation/d/1nt4FCFVX5gJnxPQMoKoxIh8tHONbTBWO1MQBMnv4z0s/edit?usp=sharing

- User survery satisfaction score: email users a satisfaction survey or add a NPS question to the app summary page, record that data
- New user sign-ups: track in Google Analytics in Firebase
- Onboard completion percentage: track on Firebase how many users complete the onboarding questions by checking if those fields are filled out in the database
- First goal created: track on Firebase how many users make their first goal by checking if it is registered on the Firestore database

- Daily Active Users (DAU): track in Firebase Analytics using automatic events such as session_start and user_engagement,
  which record when users open and interact with the ClearFund app.
- Firebase Analytics can then report the number of unique users active each day.

Retention
- 35% of users are still active at 90 days: Same Firebase Analytics retention cohort report as above, filtered to the 90-day window.
- Churn rate below 15% month-over-month: Calculated using monthly active user (MAU) counts from Firebase Analytics. Export data monthly to a Google Sheet and apply the formula: (Users Lost ÷ Users at Start of Month) × 100.
- 2x retention for users who connect a bank account: Segment users in Firebase Analytics by whether bank_account_connected fired. Compare 60-day retention rates between the two segments using Firebase's audience feature or a BigQuery export.
