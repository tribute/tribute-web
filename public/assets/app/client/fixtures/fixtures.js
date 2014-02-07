(function() {
  Tribute.Project.FIXTURES = [
    {
      id: 1,
      uri: 'https://github.com/rails/rails',
      name: 'Ruby on Rails',
      count: 45,
      projectUsers: [1, 3]
    }, {
      id: 2,
      uri: 'https://github.com/jashkenas/coffee-script/',
      name: 'CoffeeScript',
      count: 15,
      projectUsers: [2]
    }
  ];

  Tribute.Company.FIXTURES = [
    {
      id: 1,
      name: 'GitHub',
      uri: 'http://github.com',
      teams: [1, 2],
      projectUsers: [1, 2]
    }, {
      id: 2,
      name: 'American Express',
      uri: 'http://americanexpress.com',
      teams: [3]
    }, {
      id: 3,
      name: 'McGraw Hill',
      uri: 'http://mcgrawhill.com'
    }
  ];

  Tribute.Team.FIXTURES = [
    {
      id: 1,
      company: 1,
      name: 'Engineering',
      projectUsers: [1, 2]
    }, {
      id: 2,
      company: 1,
      name: 'Mobile Engineering',
      projectUsers: []
    }, {
      id: 3,
      company: 2,
      name: 'Credit Group',
      projectUsers: []
    }
  ];

  Tribute.ProjectUser.FIXTURES = [
    {
      id: 1,
      project: 1,
      company: 1,
      team: 1
    }, {
      id: 2,
      project: 2,
      company: 1,
      team: 1
    }, {
      id: 3,
      project: 1,
      company: 1,
      team: 2
    }
  ];

}).call(this);
