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
- A/B Test Name - Plan Adjustment: Easy access dashboard editing VS Finance page editing
- User Story Number - US4 - Scenario 3
- Metrics — Financial Edit Completion Rate (% of users who successfully update a financial value such as income or spending and save the change within the same session)
- Hypothesis - We believe that allowing users to edit financial values directly from the dashboard by clicking the relevant section will increase the financial edit completion rate compared to requiring users to navigate to the dedicated finance page, because editing in context reduces navigation friction and allows users to quickly adjust values where they are already viewing their financial overview.
- Experiment - Split users 50/50 when they attempt to edit financial data.
  - Group A edits financial values directly from the dashboard by clicking on the income or spending section.
  - Group B must navigate to the finance page to edit those same values.
- Variations -
  - Variant A: Users click a section of the dashboard (e.g., income, spending, or budget card) to open an inline edit modal. Changes are saved directly from the dashboard.
  - Variant B: Users click the Finance page, navigate to the appropriate field (income or spending), and edit the value there before saving.
