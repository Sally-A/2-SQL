import peewee
db = peewee.PostgresqlDatabase('week3', user='postgres',
                               host='localhost', port=5432)


class Veggie(peewee.Model):
    veggie_id = peewee.AutoField(primary_key=True)  # auto incremented integer
    color = peewee.TextField(null=False)
    name = peewee.TextField(null=False)

    def formatted_name(self):
        return self.color.capitalize() + " " + self.name.capitalize()

    class Meta:
        database = db
        table_name = 'veggies'


db.connect()
db.drop_tables([Veggie])
db.create_tables([Veggie])

seed_data = [
    {'name': 'carrot', 'color': 'orange'},
    {'name': 'onion', 'color': 'yellow'},
    {'name': 'onion', 'color': 'red'},
    {'name': 'zucchini', 'color': 'green'},
    {'name': 'squash', 'color': 'yellow'},
    {'name': 'pepper', 'color': 'red'},
    {'name': 'pepper', 'color': 'green'},
    {'name': 'pepper', 'color': 'orange'},
    {'name': 'pepper', 'color': 'yellow'},
    {'name': 'onion', 'color': 'white'},
    {'name': 'green bean', 'color': 'green'},
    {'name': 'jicama', 'color': 'tan'},
    {'name': 'tomatillo', 'color': 'green'},
    {'name': 'radicchio', 'color': 'purple'},
    {'name': 'potato', 'color': 'brown'}
]

insert = Veggie.insert_many(seed_data)
insert.execute()

# query all rows
veggies = Veggie.select()
for v in veggies:
    print(v.color, v.name)

print("")  # line break

# query all rows, sort and format
veggies = Veggie.select().order_by(Veggie.name, Veggie.color)
for i, v in enumerate(veggies):
    print(str(i+1) + ". " + v.formatted_name())
