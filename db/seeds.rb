Film.destroy_all
Director.destroy_all

jordan = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)
chloe = Director.create!(name: 'Chloe Zhao', birthdate: '1982-03-31', hometown: 'Beijing', active: true, imdb_rating: 20)
pedro = Director.create!(name: 'Pedro Almodovar', birthdate: '1949-09-25', hometown: 'Calzada De Calatrava', active: true, imdb_rating: 7)
nora = Director.create!(name: 'Nora Ephron', birthdate: '1941-06-26', hometown: 'New York', active: false, imdb_rating: 10)
guillermo = Director.create!(name: 'Guillermo del Toro', birthdate: '1964-10-09', hometown: 'Guadalajara', active: true, imdb_rating: 14)

jordan.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24')
jordan.films.create!(title: 'Us', oscar_nominated: false, oscar_wins: 0, budget: 2750000, revenue: 2800000, release_date: '2019-03-22')

chloe.films.create!(title: 'The Eternals', oscar_nominated: false, oscar_wins: 0, budget: 200000000, revenue: 402100000, release_date: '2021-10-18')
chloe.films.create!(title: 'Nomadland', oscar_nominated: true, oscar_wins: 3, budget: 5000000, revenue: 39500000, release_date: '2021-02-19')

pedro.films.create!(title: 'Julieta', oscar_nominated: false, oscar_wins: 0, budget: 15000000, revenue: 22500000, release_date: '2016-04-08')
pedro.films.create!(title: 'Pain and Glory', oscar_nominated: true, oscar_wins: 0, budget: 10800000, revenue: 38100000, release_date: '2019-03-22')

nora.films.create!(title: 'Sleepless in Seattle', oscar_nominated: true, oscar_wins: 0, budget: 21000000, revenue: 227800000, release_date: '1993-06-25')
nora.films.create!(title: 'Julie & Julia', oscar_nominated: true, oscar_wins: 0, budget: 40000000, revenue: 129500000, release_date: '2009-08-07')

guillermo.films.create!(title: "Pan's Labyrinth", oscar_nominated: true, oscar_wins: 3, budget: 19000000, revenue: 83900000, release_date: '2006-10-11')
guillermo.films.create!(title: "The Shape of Water", oscar_nominated: true, oscar_wins: 4, budget: 20000000, revenue: 195300000, release_date: '2017-08-31')
