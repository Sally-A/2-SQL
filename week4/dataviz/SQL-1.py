# %%
import sqlite3
import pandas as pd
# %%
con = sqlite3.connect('sakila.db')
# %%
def sql_to_df(sql_query):
    df = pd.read_sql(sql_query, con)
    return df
# %%
query = '''
    SELECT *
    FROM sqlite_master
    WHERE type = 'table';
'''

tables = sql_to_df(query)
tables
# %%
query = '''
    SELECT first_name, last_name
    FROM customer
'''

customer_names = sql_to_df(query)
customer_names
# %%
print(customer_names.head())
# %%
print(customer_names.tail())
# %%
print(customer_names.describe())
# %%
print(customer_names.info())
# %%
query = '''
    SELECT *
    FROM film
    WHERE description
    LIKE '%Pastry%'
'''

pastry_films = sql_to_df(query)
pastry_films.describe()
# %%
pastry_films
# %%
query = '''
    SELECT
        COUNT(title) AS Count,
        rating AS Rating
    FROM film
    WHERE description
    LIKE '%Pastry%'
    GROUP BY rating
    ORDER BY Count DESC;
'''
pastry_films_by_rating = sql_to_df(query)
pastry_films_by_rating
# %%
pastry_films_by_rating.hist(column='Count', grid=False)
# %%
