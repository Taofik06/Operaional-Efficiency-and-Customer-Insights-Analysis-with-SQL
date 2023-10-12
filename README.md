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
- Runner and Customer Experience
- Pricing and Ratings
- Bonus: Ingredient Optimisation, DML Challenges (DML = Data Manipulation Language)

## Section A. Pizza Metrics
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

      Customers with ids 101, 102, and 103 has ordered both Meatlovers and Vegetarians Pizza. 
      While customers with ids 104 and 105 has ordered only Meatlover and Vegetarian respectively

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


## Section B Runner and Customer Experience
- How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
- What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
- Is there any relationship between the number of pizzas and how long the order takes to prepare?
- What was the average distance travelled for each customer?
- What was the difference between the longest and shortest delivery times for all orders?
- What was the average speed for each runner for each delivery and do you notice any trend for these values?
- What is the successful delivery percentage for each runner?

## Solution and Querries
1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/ef7ef0f9-0c64-484d-96fd-cd6e09bb6ba4)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/509f9e69-9e82-4fce-8b81-20675915fa92)

The first week had the highest numbers of registered runners (3)

2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/1e7d165f-069f-4095-93d5-cbe45c929a84)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/fa6bc365-e0a8-40eb-9654-266237503de3)

Runner 3 had the lowest average time while Runner 2 had the highest avg time, the difference between the average time 
might be due to the distance they had to cover to reach the HQ.

3. Is there any relationship between the number of pizzas and how long the order takes to prepare?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/9770e916-a095-497d-b7ec-d55ef55d412c)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/28805387-48ab-47f5-8425-a16bd97739b7)

Yes, there is a positive relationship between the number of pizzas and the time taken, the higher the number of pizza, the more time taken to prepare.

4. What was the average distance travelled for each customer?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/6c17fe05-609d-451c-9aba-180d600eeb22)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/6f647be8-e859-4ae8-9181-b3da7ecb5653)

Orders from Customer 105 and 104 requires the highest and lowest average distance travelled respectively

5. What was the difference between the longest and shortest delivery times for all orders?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/48acaff0-6bca-4e06-b367-9a95b18017ed)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/ad88cc7f-ef59-424e-b101-37b73301a3af)

            There is 30minutes between the shortest and longest delivery times

6. What was the average speed for each runner for each delivery and do you notice any trend for these values?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/9124f5c3-59ea-480d-b8c3-552078a52ab3)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/8e213da3-456a-4ad1-8717-afc8b2e4a26a)

            The average speed for each runner per orders

7. What is the successful delivery percentage for each runner?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/29903f75-efb8-4fec-903e-8dbb39aa69a9)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/0599165c-7a6f-427d-8687-b6afba2e3237)

            Runner 1 has 100% delivery rate.

## Section C: Pricing and Ratings
- If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - how much money has Pizza Runner made so far if there are no delivery fees?
- What if there was an additional $1 charge for any pizza extras? Add cheese is $1 extra
- The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner, how would you design an additional table for this new dataset - generate a schema for this new table and insert your own data for ratings for each successful customer order between 1 to 5.
- Using your newly generated table - can you join all of the information together to form a table which has the following information for successful deliveries?
            - customer_id
            - order_id
            - runner_id
            - rating
            - order_time
            - pickup_time
            - Time between order and pickup
            - Delivery duration
            - Average speed
            - Total number of pizzas

  ## Solutions and Querries
 1. If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - how much money has Pizza Runner made so far if there are no delivery fees?
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/6f8e6d7f-e8d1-43d7-a986-7c7368d095e2)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/9a31c785-5470-437f-8b4f-b7d4b8ca398a)

            With the price given, Pizza runner has made $138

2.  What if there was an additional $1 charge for any pizza extras? Add cheese is $1 extra
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/7d547b58-ffa3-42bf-a075-e690d3669522)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/e9795dd2-c932-4656-8df9-a6d105d2155b)

            With extra addition, Pizza Runner has made $144

3. The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner, how would you design an additional table for this new dataset - generate a schema for this new table and insert your own data for ratings for each successful customer order between 1 to 5.
For this, there is need to create  table, and that is done below.
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/321ed3ef-c591-46ed-85c7-eff77f285fb1)

4. Join all of the information together to form a table 
![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/f77d541f-ce57-4ed0-ac6f-c9870f5f2d36)

![image](https://github.com/Taofik06/Pizza-Runner/assets/123642327/aed499cc-fb5e-4305-9e03-c10fa2580236)
