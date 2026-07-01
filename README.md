# Axon-Manufacture-Analytics (Excel, MySQL, Tableau, Power BI)
## Project Objective
Axon Manufacturing wants to create a report that focuses on daily production performance, highlighting output levels, quality trends, waste control, and overall efficiency. It helps teams quickly spot issues, track progress, and make decisions to improve manufacturing results

## Dataset used
- <a href="https://github.com/micky-abraham/Manufacture-Analytics-Project/blob/main/Manufacturing%20Project%20Data.xlsx">Dataset</a>

## KPIs
- Manufactured Quantity
- Rejected Quantity
- Processed Quantity
- Wastage Percentage
- On-Time Delivery Rate
- Repeat Order Ratio
- Employee wise Rejected Quantity
- Machine wise Rejected Quantity
- Production Comparison Trend
- Manufacture vs Rejected
- Department wise Manufacture vs Rejected
- Per-Day Production Efficiency

## Excel Dashboard
- <a href="https://github.com/micky-abraham/Manufacture-Analytics-Project/blob/main/Manufacturing%20-%20Excel.xlsx">View Dashboard</a>

## Process
- Loaded dataset into **power query** for cleaning and cleansing the data
- Connected fact table to multiple dimension tables and established **star schema data modeling**
- Created **pivot tables** for inserting various graphs and charts
- Added necessary **slicers** for filtering out the data

## Dashboard
<img width="1656" height="782" alt="Screenshot 2026-06-30 152556" src="https://github.com/user-attachments/assets/1e86eb48-7642-442d-b733-df9fbbe53ba0" />

## Tableau Dashboard
- <a href="https://github.com/micky-abraham/Manufacture-Analytics-Project/blob/main/Manufacturing%20-%20Tableau.twbx">View Dashboard</a>

## Process
- Imported data and connected tables in **logic space**
- Drag fields into rows, columns, and marks to build charts and tables
- Combine multiple sheets into two dashboards and arrange visuals
- Add **navigation** for switching between dashboards
- Insert **filters and actions** for dashboard interactivity 

## Dashboard - Production & Efficiency
<img width="1296" height="796" alt="Screenshot 2026-06-30 152718" src="https://github.com/user-attachments/assets/36811eba-614f-42ef-926d-efb98e0f34f8" />

## Dashboard - Quality & Delivery
<img width="1300" height="802" alt="Screenshot 2026-06-30 152743" src="https://github.com/user-attachments/assets/2b072c21-d624-462f-952a-4360506386b9" />

## Power BI Dashboard
- <a href="https://github.com/micky-abraham/Manufacture-Analytics-Project/blob/main/Manufacturing%20-%20Power%20BI.pbix">View Dashboard</a>

## Process
- Clean and shape data in **power query**
- Link tables and define relationships for analysis 
- Design charts, tables, and cards and drag them to the canvas
- Combine multiple visuals and add **filters**

## Dashboard
<img width="1372" height="768" alt="Screenshot 2026-06-30 153412" src="https://github.com/user-attachments/assets/66db7904-1a87-4942-aadd-300a2b59150f" />

## MySQL Queries
- <a href="https://github.com/micky-abraham/Manufacture-Analytics-Project/blob/main/Manufacturing%20-%20SQL.sql">View Dashboard</a>

## Process
- Create database and activate it 
- Use **load data infile statement** for loading big data files
- Data validation done by extracting multiple fields from tables using joins
- Retrieve information with SELECT statement and run queries for each KPIs  

## Dashboard
<img width="1235" height="718" alt="Screenshot 2026-07-01 125650" src="https://github.com/user-attachments/assets/6db800ce-0cb5-4535-89b4-9cc7e1573145" />
<img width="1391" height="663" alt="Screenshot 2026-07-01 130016" src="https://github.com/user-attachments/assets/281995e8-c84d-4892-a6ed-2628f3a4f68e" />
<img width="962" height="647" alt="Screenshot 2026-07-01 130235" src="https://github.com/user-attachments/assets/be487cfd-fa13-455f-9d59-05c7e6249386" />

## Project Insights
- Production peaked in March at 5.6M units, showing strong growth compared to January’s 4.0M
- But rejection rates were highest in departments like Footwear and Knitwear, each with over 120K rejected units, which signals quality concerns
- Machine analysis shows Textile machines account for 54% of rejections, so that’s a clear area to address
- On‑time delivery is solid at 67%, but the 33% late orders highlight a gap in scheduling or logistics
- Efficiency trends stayed between 78–88%, meaning we’re stable but have room to push higher by reducing waste and improving machine performance

## Conclusion
It shows clear trends in production output, but rejection rates are rising, which points to quality issues that need immediate attention. The efficiency patterns reveal opportunities to streamline processes and reduce waste. The delivery performance indicates strengths in on‑time orders but also areas where delays are impacting results. Overall, we should focus on sustaining growth, correcting declines, and driving continuous improvement in manufacturing performance

  
