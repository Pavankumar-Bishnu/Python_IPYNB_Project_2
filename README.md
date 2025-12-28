# Flight Price Prediction 

A comprehensive data analytics and machine learning project that predicts flight prices based on various parameters including airline, source, destination, stops, and timing information. This project combines Python for data analysis and modeling with SQL for data extraction and transformation.

## Dataset
- **Records:**               10,461 flight entries
- **Features:**              16 columns including airline, route details, timing, and price
- **Time Period:**           March 2019 - June 2019
- **Price Range:**           ₹1,759 - ₹79,512
- 
> **Data Set Used**          : <a href="https://github.com/Pavankumar-Bishnu/Python_IPYNB_Project_2/blob/main/flight_dataset(Kaggle).csv"> Click to open </a>


## Key Features
- **Airlines:**               IndiGo, Air India, Jet Airways, and more
- **Routes:**                 Multiple Indian cities (Delhi, Bangalore, Kolkata, Cochin, etc.)
- **Stops:**                  0-4 stops per journey
- **Time Analysis:**          Departure/arrival time buckets (Morning, Afternoon, Evening, Night)
- **Duration:**               Flight duration in minutes (75-2860 minutes)

## Technologies Used
- **Python :**                    Pandas, NumPy, scikit-learn, matplotlib, seaborn
- **SQL :**                      MySQL for data querying and transformation
- **Jupyter Notebook :**          For exploratory data analysis
- **Excel :**                    Initial data storage and preprocessing

## Project Workflow
1. **Data Extraction :**           SQL queries to extract and filter flight data
2. **Data Cleaning :**             Handle missing values, outliers, and data formatting
3. **Exploratory Data Analysis :** Visualize price distributions, trends by airline/route
4. **Feature Engineering:**       Create time buckets, duration calculations, encoding categorical variables
5. **Model Building :**            Train regression models (Linear Regression, Random Forest, XGBoost)
6. **Model Evaluation :**          Compare performance using RMSE, MAE, R² score
7. **Insights :**                  Identify key price drivers and patterns
   
> **Data Set (Cleaned)**        : <a href="https://github.com/Pavankumar-Bishnu/Python_IPYNB_Project_2/blob/main/Flight_Price_Prediction_Data.xlsx"> Click to open </a>

> **CODE (ipynb) FILE           :** <a href="https://github.com/Pavankumar-Bishnu/Python_IPYNB_Project_2/blob/main/Flight_Price_Prediction.ipynb"> Click Now </a>

## SQL Analysis
- Price aggregation by airline and route
- Peak/off-peak time analysis
- Stop count impact on pricing
- Temporal trends and seasonal patterns
- 
> **SQL Queries File**         : <a href="https://github.com/Pavankumar-Bishnu/Python_IPYNB_Project_2/blob/main/Flight%20Data.sql"> Click to open </a>


## Key Insights
- Average flight price : ₹9,027
- Most flights have 0-1 stops (80% of data)
- Duration ranges from 1.25 hours to 47+ hours
- Price variation across different time buckets and airlines

![PPT](https://github.com/Pavankumar-Bishnu/Python_IPYNB_Project_2/blob/main/PPT.png)

**Data Visualization & Presentation File** : <a href=""> Click PPT Now </a>

## Acknowledgments
 - Dataset source : [Kaggle/Original Source]
 - Inspiration from aviation industry analytics
 - Thanks to the data science community for guidance

## Key Findings & Recommendations
- For Travelers 
  - Book SpiceJet or Air Asia for budget travel (₹4,336-₹5,594 avg)
  - Direct flights save time but cost 15-20% more
  - Morning flights offer better availability but higher prices
  - Kolkata-Bangalore route offers competitive pricing
- For Airlines
  - Delhi-Cochin route has highest demand - increase frequency
  - Premium services (Business class) command 5-6x regular pricing
  - Morning departure slots are most profitable
  - Optimize multi-stop routes to balance price and duration
