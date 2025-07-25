# Netflix Content Analysis Using SQL 👨‍💻

## Overview  
This project creates a structured MongoDB-style database `netflix` from a public Netflix dataset and uses SQL queries to analyze content trends and user behavior. The analysis addresses multiple business questions about content distribution and user preferences using window functions, aggregation, and string transformations.

## 🔍 Objectives  
- Understand the distribution between **Movies** vs **TV Shows**  
- Discover the most common ratings for each content type  
- Analyze content by release year and country  
- Identify longest movies, recent additions, and top directors/cast  
- Segment content by genre and keyword-based sentiment  

## 📦 Dataset Source  
- Public Netflix titles dataset (CSV) from Kaggle  
- Column structure: `show_id`, `type`, `title`, `director`, `casts`, `country`, `date_added`, `release_year`, `rating`, `duration`, `listed_in`, `description`

## 🧱 Database Schema  
- Created a normalized schema with the table `netflix` using the provided SQL DDL  
- Populated sample data and executed representative SQL queries to explore the dataset :contentReference[oaicite:1]{index=1}

## 🧪 Key Queries & Analysis  
1. Count of Movies vs TV Shows  
2. Most common rating per content type (using window functions)  
3. Movies released in 2020  
4. Top 5 content-producing countries  
5. Longest movie by duration  
6. Content added in the last five years  
7. Titles directed by a specific director  
8. TV shows with more than five seasons  
9. Genre popularity breakdown  
10. Country-specific release trends (focus: India)  
11. Documentary content check  
12. Items without a director  
13. Actor-based counts (e.g., Salman Khan in last 10 years)  
14. Top actors in Indian-produced content  
15. Keyword-based categorization of content sentiment (e.g., violence detection)

## 📉 Analysis Insights  
- Clear distribution of types and ratings across genres  
- Identification of retention opportunities based on newly added content  
- Genre segmentation shows dominant categories by region  
- Keyword sentiment categorization offers strategic content guidelines

## 🧾 How to Run  
1. Clone the repository  
2. Load the CSV into your PostgreSQL/Postgres-like environment  
3. Run the schema DDL to create the table  
4. Execute the provided SQL analysis queries  
5. Review results and visualizations as applicable

## 🧰 Tech Stack  
- **SQL**: PostgreSQL  
- **Database Operations**: DDL/DML, window functions, string functions  
- **Client Tools**: pgAdmin or any SQL client  
- **Visualization**: Optional Power BI/Excel dashboards if extended

## 📈 Business Relevance  
Project supports decisions in **content strategy**, **geographic expansion**, and **genre investment** by revealing user preferences, emerging trends, and content gaps.

## 👤 Author  
**Manish Jangir**  
- GitHub: [your-profile-link]  
- Email: manishjangir@email.com  
- Portfolio: SQL/Dashboard projects

---

## 🔗 References & Inspiration  
- Project structure and query topics adapted from public Netflix analysis repositories on GitHub and SQL query guides :contentReference[oaicite:2]{index=2}  
- README layout adapted from data science documentation templates for clarity and recruiter readability :contentReference[oaicite:3]{index=3}  
