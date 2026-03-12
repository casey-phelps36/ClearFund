# AB Tests

A/B Test 1
- A/B Test Name - Signup Form Length: Minimal vs Detailed Signup
- User Story Number - US1: Account Creation
- Metrics -
  - Adoption – percentage of users who successfully create an account
  - Task Success – signup completion rate
  - Happiness – user satisfaction (via NPS after onboarding)
  - Hypothesis - if the signup process only asks for email and password, users will complete account creation more often than if they are asked for additional profile information during signup.
  - Firebase events to track:
    sign_up_attempt
    sign_up_success
    sign_up_failure
    login_success
- Experiment - The experiment will be implemented using Firebase Remote Config and Firebase A/B Testing. Users will be randomly assigned to two groups: 50% control group and 50% experiment group. All users will see only one version of the signup screen.

Firebase Analytics events will track:

  sign_up_attempt
  
  sign_up_success
  
  sign_up_failure

The main metric being measured will be the signup conversion rate: sign_up_success / sign_up_attempt
The experiment will run until statistically significant results are observed.
- Variations
  - Variation A (Control)
    Minimal signup form:
    
        Email
    
        Password
    
        Create Account
    
      Users complete additional profile details later during onboarding.
  - Variation B (Experiment)
    Extended signup form:
    
        Email
    
        Password
    
        Age range
    
        Financial experience level
    
        Create Account
    
      Users provide more information during account creation.

A/B Test 2
- A/B Test Name - Inline Error Messages vs Banner Error Messages
- User Story Number - US2 – User Login
- Metrics -
  Task Success: Successful login rate
  Engagement: Users reaching dashboard
  Happiness: Reduced failed login attempts
- Hypothesis - Displaying inline error messages under the input fields will improve login success compared to a banner error at the top, because users can more easily see what field caused the problem.
  Problem - Users may fail to log in because error messages are unclear or not connected to the correct input field. This creates confusion and may cause users to abandon the login process.
- Experiment -
  Using Firebase A/B Testing, users will be randomly split:
  50% see banner error messages
  50% see inline error messages
  Firebase Analytics will track:
  login_attempt
  login_success
  login_failure
  dashboard_view
- Variations- 
  Variant A – Banner Error
  Error message appears at the top of the screen.
  Variant B – Inline Error
  Error message appears directly under the email or password field.
        


A/B Test 3
- A/B Test Name - 
- User Story Number - 
- Metrics - 
- Hypothesis - 
- Experiment - 
- Variations -


A/B Test 4
- A/B Test Name - Plan Adjustment: Contribution Slider vs. Numeric Input with Live Preview
- User Story Number - US4 - Scenario 3
- Metrics — Plan Confirmation Rate (% of users who reach and tap the Confirm button after adjusting their contribution, with timeline update reflecting within 1 second)
- Hypothesis - We believe that a typed numeric input paired with a live-updating goal preview will increase plan confirmation rate compared to a slider, because exact dollar input removes ambiguity and seeing the projected date update in real time gives users the confidence to commit.
- Experiment - Split users 50/50 on the plan adjustment screen.
  - Group A adjusts contribution via a draggable slider with real-time timeline update.
  - Group B types an exact amount into a numeric field and sees a live preview card update (debounced at 300ms). Run for 4 weeks at 95% confidence.
- Variations -
  - Variant A: slider control, timeline updates as user drags, Confirm triggers auto-save.
  - Variant B: numeric text input, live preview card updates as user types, Confirm triggers auto-save.
