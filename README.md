# Pizza-Runner

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/72550355-1162-4c65-85f2-30fa70319883)

# Introduction

Danny was scrolling through his Instagram feed when something really caught his eye - “80s Retro Styling and Pizza Is The Future!”
Danny was sold on the idea, but he knew that pizza alone was not going to help him get seed funding to expand his new Pizza Empire - so he had one more genius idea to combine with it - he was going to Uberize it - and so Pizza Runner was launched!
Danny started by recruiting “runners” to deliver fresh pizza from Pizza Runner Headquarters (otherwise known as Danny’s house) and also maxed out his credit card to pay freelance developers to build a mobile app to accept orders from customers.

# Data source
Danny company provided the data to be used for the analysis to write fully functioning SQL queries to help him answer his questions! The 3 key datasets for this case study are:
- **runners**
- **customer_orders**
- **runner_orders**
- **pizza_names**
- **pizza_recipes**
- **pizza_toppings**

# Data Model and Schema
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/f9d2619e-df05-4dc9-89f1-5299a4956edf)

# Case study 
This case study questions were divided into different areas and solved parts are highlighted as follows: 
- Pizza Metrics
- Pricing and Ratings
- Bonus: Runner and Customer Experience, Ingredient Optimisation, DML Challenges (DML = Data Manipulation Language)

## A. Pizza Metrics
- How many pizzas were ordered?
- How many unique customer orders were made?
- How many successful orders were delivered by each runner?
- How many of each type of pizza was delivered?
- How many Vegetarian and Meatlovers were ordered by each customer?
- What was the maximum number of pizzas delivered in a single order?
- For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
- How many pizzas were delivered that had both exclusions and extras?
- What was the total volume of pizzas ordered for each hour of the day?
- What was the volume of orders for each day of the week?

## Solution and Querries
1. How many pizzas were ordered?

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/94c50ba1-a2c3-4e07-9fea-52dbc2766e93)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/5a42b006-2791-480b-aea8-86a315ba10c0)
            
            In total, 14 Pizzas were ordered

2. How many unique customer orders were made?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/14513a84-e9b9-40f3-abc8-536dbe84984f)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/86a057fd-999e-46f2-9afe-ef99c498218b)
          
          10 Unique customer orders were made

3. How many successful orders were delivered by each runner?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/e941c542-8c8b-401e-878f-0a6468518b2f)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/52757611-b2ac-4df0-9e50-2074297e9e51)

        Runner 1 delivered the maximum orders (4)

4. How many of each type of pizza was delivered?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/90e8cf1d-5e26-443c-9833-ce289ae9a267)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/4796e2ac-e1fe-46ec-bafb-a16c809223c1)

      Meatlovers Pzza (9) and Vegetarian Pizza (3) were delivered
      
5. How many Vegetarian and Meatlovers were ordered by each customer?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/06812abf-a265-4ffb-94f8-457f52a16242)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/6b89ab99-eaa5-475c-822f-0ce5b949abbe)

      Customers with ids 101, 102, and 103 has ordered both Meatlovers and Vegetarians Pizza. While customers with ids 104 and 105 has ordered only Meatlover and Vegetarian respectively

6. What was the maximum number of pizzas delivered in a single order?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/5f1d57d9-5810-451e-8ea3-3a9bb50e60a9)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/4f340b4c-6d2c-42b5-bd0d-f1b8765f4f50)

    The maximum of Pizzas delivered in a single order is 3

7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/95b6f6a5-d000-45e2-9823-180bdc646488)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/eacf2889-491e-4e35-8780-70f05761e87f)

8. How many pizzas were delivered that had both exclusions and extras?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/4a501950-bd7c-43aa-9495-d943da27bc9f)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/8fdd3924-1380-4152-a17e-4ef07f73ada4)

   Just one order was delivered that has both exclusions and extras.

9. What was the total volume of pizzas ordered for each hour of the day?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/42e6f04c-b860-4aea-9cdf-fa5d40598c66)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/a78ee088-7627-49d8-b972-8d84aa36767a)

    More Pizzas were oredered in the Afternoon and towards the end of the day.
    
10. What was the volume of orders for each day of the week?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/f3814561-ad07-4a98-b1d5-8fc8216a3193)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/f28347d6-c266-4697-bbe0-38e5be9661c9)

    Wednesday and Thursday are the days of the week with the highest Pizza ordered.

