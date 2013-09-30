Tribute.Project.FIXTURES = [
  id: 1
  uri: 'https://github.com/rails/rails'
  name: 'Ruby on Rails'
  count : 45
  teams: [1,2]
,
  id: 2
  uri: 'https://github.com/jashkenas/coffee-script/'
  name: 'CoffeeScript'
  count: 15
]

Tribute.Company.FIXTURES = [
  id: 1
  name: 'GitHub'
  teams: [1,2]
,
  id: 2
  name: 'American Express'
  teams: [3]
,
  id: 3
  name: 'McGraw Hill'
  teams: [4]
]

Tribute.Team.FIXTURES = [
  id: 1
  company: 1
  name: 'Engineering'
  projects: [1,2]
,
  id: 2
  company: 1
  name: 'Mobile Engineering'
  projects: [1]
,
  id: 3
  company: 2
  name: 'Credit Group'
  projects: [2]
]
