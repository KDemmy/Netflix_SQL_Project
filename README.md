# 📺 Netflix Dataset SQL Project

## Overview  
This project uses SQL to analyze a Netflix dataset with ~15 key questions. Each query is structured to answer a business-style question relevant to content strategy, regional trends, metadata quality, and feature insights.

---

## 🧾 Business Questions, SQL and Insights

| #  | Business Objective                                                        | SQL Query (abbreviated)                     | Insight Summary                                |
|----|-----------------------------------------------------------------------------|---------------------------------------------|------------------------------------------------|
| 1  | Movies vs TV Shows mix                                                       | `SELECT type, COUNT(*)`                    | Understand content offerings                   |
| 2  | Most frequent rating per content type                                        | Window function partitioning by type       | Guides content maturity strategy               |
| 3  | Movies released in 2020                                                      | `WHERE type='Movie' AND release_year=2020` | Highlights recent film titles                  |
| 4  | Top 5 countries by Netflix content                                           | Unnest country and count groups            | Regional content distribution analysis          |
| 5  | Longest movie duration                                                       | Parse `duration` and ORDER BY              | Identifies epic-length films                   |
| 6  | Titles added in last 5 years                                                 | Date parsing or interval filter             | Recency of catalog updates                     |
| 7  | Shows by director "Rajiv Chilaka"                                            | Unnest director and filter                  | Director-specific contribution insights        |
| 8  | TV shows with ≥6 seasons                                                     | Parse seasons from `duration`               | Franchise vs limited series identification     |
| 9  | Genre-level count across catalog                                             | Unnest listed_in group and count            | Genre popularity and content gaps              |
| 10 | Yearly content release share in India                                        | Count and divide by India's total           | Regional focus and growth opportunities        |
| 11 | Documentary movie titles                                                     | Filter `listed_in LIKE '%Documentaries%'`   | Depth of documentary library                   |
| 12 | Items missing director metadata                                              | `WHERE director IS NULL`                    | Metadata quality check                          |
| 13 | Films with Salman Khan in last 10 years                                      | Filter by casts and year threshold          | Actor content trends over time                 |
| 14 | Top 10 Indian actors by movie count                                          | Unnest casts and count                     | Most popular actors in Indian content          |
| 15 | Keyword sentiment classification (“Kill”/“Violence”)                         | `CASE WHEN ... THEN 'Bad' ELSE 'Good'`     | Enable content moderation or tagging           |

---

## 🚀 How to Run This Project  
1. Clone this repo.  
2. Load the Netflix CSV into PostgreSQL or your SQL environment.  
3. Run the `netflix` table DDL.  
4. Execute the above queries in sequence.  
5. Review results, take screenshots, or link to dashboard visualizations.

---

## 📚 Project Purpose & Tech Stack  
- **Platform used**: PostgreSQL (pcAdmin or any SQL client)  
- **Technical focus**: SQL window functions, string parsing, aggregations, filtering  
- **Business relevance**: Content mix analysis, regional trends, metadata completeness, sentiment insights

---

## 🧠 Why This Project Stands Out  
- Covers **15+ business questions** with concise SQL—demonstrates analytical thinking and SQL depth.  
- Each query linked to a **strategic insight**, showcasing storytelling ability.  
- **Clean documentation**—ideal for recruiters or technical reviewers (per best practices).  
  :contentReference[oaicite:1]{index=1}

---

## 👤 About the Author  
**Manish Jangir**  
- GitHub: [your-link]  
- Portfolio: SQL, BI dashboard, and product analytics projects  
- Email: manishjangir@email.com

---

## 🔗 References  
- Project structure inspired by public Netflix SQL repos and README templates from Kaggle & GitHub sources. :contentReference[oaicite:2]{index=2}  
- README best practices adapted from project documentation guides. :contentReference[oaicite:3]{index=3}
