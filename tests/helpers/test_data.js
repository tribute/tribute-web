function testData() {
  var testdata = {};
  testdata.project = { id: 1, name: "RubyOnRails", description: "Ruby MVC Web framework", uri: "http://github.com/rails/rails", "projectusers": ["1"] };
  testdata.projectuser = { id: "1", project: "1", team: "1" };
  testdata.team = { id: "1", company: "1", name: "Engineering", projectusers: ["1"] };
  testdata.company = { id: "1", name: "Github", uri: "http://github.com", teams: ["1"] };
  testdata.projects = [];
  testdata.projectusers = [];
  testdata.companies = [];
  testdata.teams = [];
  testdata.projects[0] = testdata.project;
  testdata.projectusers[0] = testdata.projectuser;
  testdata.companies[0] = testdata.company;
  testdata.teams[0] = testdata.team;

  return testdata;
}

export default testData;
