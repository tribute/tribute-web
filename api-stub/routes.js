module.exports = function(server) {

  // Create an API namespace, so that the root does not 
  // have to be repeated for each end point.
	server.namespace('/api', function() {

		// Return fixture data for '/api/posts/:id'
		server.get('/posts/:id', function(req, res) {
			var post = {
                "post": {
                    "id": 1,
                    "title": "Rails is omakase",
                    "comments": ["1", "2"],
                    "user" : "dhh"
                },

                "comments": [{
                    "id": "1",
                    "body": "Rails is unagi"
                }, {
                    "id": "2",
                    "body": "Omakase O_o"
                }]
            };

			res.send(post);
		});

        // Projects -----------------------------------------------
        server.get('projects', function(req, res) {
            var projects = { "projects": [{
                  "id": "1",
                  "uri": "https://github.com/rails/rails",
                  "name": "Ruby on Rails",
                  "count" : "45",
                  "projectusers": ["1","3"],
                }, {      
                  "id": "2",
                  "uri": "https://github.com/jashkenas/coffee-script/",
                  "name": "CoffeeScript",
                  "count": "15",
                  "projectusers": ["2"],
                }],

                "projectusers": [{
                  "id": "1",
                  "project": "1",
                  "team": "1",
                }, {
                  "id": "2",
                  "project": "2",
                  "team": "1"
                }, {
                  "id": "3",
                  "project": "1",
                  "team": "2"
                }],

                "teams": [{
                  "id": "1",
                  "company": "1",
                  "name": "Engineering",
                }, {
                  "id": "2",
                  "company": "1",
                  "name": "Dev Ops",
                }, {
                  "id": "3",
                  "company": "2",
                  "name": "Credit Group",
                }],

                "companies": [{
                  "id": "1",
                  "name": "GitHub",
                  "uri": "http://github.com",
                  "teams": [1,2],
                }, {
                  "id": "2",
                  "name": "American Express",
                  "uri": "http://americanexpress.com",
                  "teams": [3],
                }, {
                  "id": "3",
                  "name": "McGraw Hill",
                  "uri": "http://mcgrawhill.com",
                  "teams": []
                }]

            };

            res.send(projects);
        });

        var projectId = 2;
        server.post('projects', function(req, res) {
            projectId = projectId + 1;
            var json = req.body;
            json['project']['id'] = projectId;

            res.send(json);
        });

        // Project Users --------------------------------------------
        server.get('projectusers', function(req, res) {

            var projectUsers = { "projectusers": [{
                  "id": "1",
                  "project": "1",
                  "team": "1",
                }, {
                  "id": "2",
                  "project": "2",
                  "team": "1"
                }, {
                  "id": "3",
                  "project": "1",
                  "team": "2"
                }],

                "teams": [{
                  "id": "1",
                  "company": "1",
                  "name": "Engineering"
                }, {
                  "id": "2",
                  "company": "1",
                  "name": "Dev Ops"
                }, {
                  "id": "3",
                  "company": "2",
                  "name": "Credit Group"
                }]
            };

            res.send(projectUsers);
        });

        // Companies -------------------------------------------------
        server.get('companies', function(req, res) {
            var companies = 
                { "companies": [{
                  "id": "1",
                  "name": "GitHub",
                  "uri": "http://github.com",
                  "teams": [1,2],
                }, {
                  "id": "2",
                  "name": "American Express",
                  "uri": "http://americanexpress.com",
                  "teams": [3],
                }, {
                  "id": "3",
                  "name": "McGraw Hill",
                  "uri": "http://mcgrawhill.com",
                  "teams": []
                }],
                "teams": [{
                  "id": "1",
                  "company": "1",
                  "name": "Engineering",
                  "description": "Back-end engineering",
                  "projectusers": [1,2]
                }, {
                  "id": "2",
                  "company": "1",
                  "name": "DevOps",
                  "description": "",
                  "projectusers": [3]
                }, {
                  "id": "3",
                  "company": "2",
                  "name": "Credit Group",
                  "description": "",
                  "projectusers": []
                }],
               "projectusers": [{
                  "id": "1",
                  "project": "1",
                  "team": "1",
                }, {
                  "id": "2",
                  "project": "2",
                  "team": "1"
                }, {
                  "id": "3",
                  "project": "1",
                  "team": "2"
                }],
                "projects": [{
                  "id": "1",
                  "uri": "https://github.com/rails/rails",
                  "name": "Ruby on Rails",
                  "count" : "45",
                  "projectusers": ["1","3"],
                }, {      
                  "id": "2",
                  "uri": "https://github.com/jashkenas/coffee-script/",
                  "name": "CoffeeScript",
                  "count": "15",
                  "projectusers": ["2"],
                }]

              };

            res.send(companies);
        });

        server.get('teams', function(req, res) {
          var teams = {
                "teams": [{
                  "id": "1",
                  "company": "1",
                  "name": "Engineering",
                  "description": "Back-end engineering",
                  "projectusers": [1,2]
                }, {
                  "id": "2",
                  "company": "1",
                  "name": "DevOps",
                  "description": "",
                  "projectusers": [3]
                }, {
                  "id": "3",
                  "company": "2",
                  "name": "Credit Group",
                  "description": "",
                  "projectusers": []
                }],
                "companies": [{
                  "id": "1",
                  "name": "GitHub",
                  "uri": "http://github.com",
                  "teams": [1,2],
                }, {
                  "id": "2",
                  "name": "American Express",
                  "uri": "http://americanexpress.com",
                  "teams": [3],
                }, {
                  "id": "3",
                  "name": "McGraw Hill",
                  "uri": "http://mcgrawhill.com",
                  "teams": []
                }],
                "projectusers": [{
                  "id": "1",
                  "project": "1",
                  "team": "1",
                }, {
                  "id": "2",
                  "project": "2",
                  "team": "1"
                }, {
                  "id": "3",
                  "project": "1",
                  "team": "2"
                }],
                "projects": [{
                  "id": "1",
                  "uri": "https://github.com/rails/rails",
                  "name": "Ruby on Rails",
                  "count" : "45",
                  "projectusers": ["1","3"],
                }, {      
                  "id": "2",
                  "uri": "https://github.com/jashkenas/coffee-script/",
                  "name": "CoffeeScript",
                  "count": "15",
                  "projectusers": ["2"],
                }]
          };

          res.send(teams);

        });
	});

};
