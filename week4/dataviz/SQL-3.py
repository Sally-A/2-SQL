# %%
import sqlite3
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

con = sqlite3.connect('sakila.db')


def sql_to_df(sql_query):
    df = pd.read_sql(sql_query, con)
    return df


# %%
query = '''
    SELECT
        cat.name category_name,
        sum( IFNULL(pay.amount, 0) ) revenue
    FROM category cat
    LEFT JOIN film_category flm_cat
    ON cat.category_id = flm_cat.category_id
    LEFT JOIN film fil
    ON flm_cat.film_id = fil.film_id
    LEFT JOIN inventory inv
    ON fil.film_id = inv.film_id
    LEFT JOIN rental ren
    ON inv.inventory_id = ren.inventory_id
    LEFT JOIN payment pay
    ON ren.rental_id = pay.rental_id
    GROUP BY cat.name
    ORDER BY revenue DESC
    limit 5;
'''

categories_by_gross = sql_to_df(query)
categories_by_gross

# fig, ax = plt.subplots(figsize=(10, 5))
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10, 5))

ypos = np.arange(len(categories_by_gross["revenue"]))
bars = ax1.bar(ypos, categories_by_gross["revenue"].round(3), width=0.50)
ax1.set_xticks(ypos)
ax1.set_xticklabels(categories_by_gross["category_name"])
ax1.set_ylim(ymin=3000, ymax=6000)
ax1.set_title("gross by category", fontsize=14)
ax1.set_ylabel("gross sales", fontsize=12)

for bar in bars:  # add data labels
    height = bar.get_height()
    ax1.annotate(f"{height}",
                 xy=(bar.get_x() + bar.get_width() / 2, height),
                 xytext=(0, 3),  # 3 points vertical offset
                 textcoords="offset points",
                 ha="center", va="bottom",
                 fontweight="semibold")

# plt.show()

explode = np.zeros(len(categories_by_gross["category_name"]))
explode[0] = 0.1

print(explode)
# fig, ax = plt.subplots()
ax2.pie(categories_by_gross["revenue"].round(3), explode=explode, labels=categories_by_gross["category_name"], autopct='%1.1f%%',
        shadow=True, startangle=90)
ax2.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.

plt.show()


# %%

query = '''
    SELECT
        COUNT(title) as Count,
        rating AS Rating
    FROM film
    WHERE description
    LIKE '%Pastry%'
    GROUP BY rating
    ORDER By Count DESC;
'''

df = sql_to_df(query)
df.set_index('Rating', inplace=True)
num_adult_pastry = df.loc['NC-17', 'Count']
total = df['Count'].sum()
labels = ['all other', 'adult pastry']
nums = np.array([total, num_adult_pastry])
nums


# %%

explode = [0, 0.2]

fig, ax = plt.subplots()
ax.pie(nums, labels=labels, explode=explode, shadow=True)
ax.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.

plt.show()

# %%

