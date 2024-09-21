Feature: Fetch employee details who are still enrolled in the company

  Background:
    * def generateEmployeeNames =
    """
    function(prefix, count) {
      var names = [];
      for (var i = 1; i <= count; i++) {
        names.push(prefix + i);
      }
      return names;
    }
    """

    * def array1 = generateEmployeeNames('Employee', 15000)
    * def array2 = array1.slice(0, 200)


    * print 'Total employees enrolled:', array1.length
    * print 'Total employees who left:', array2.length

    * print 'Total employees enrolled names:', array1
    * print 'Total employees who left names:', array2

  Scenario: Fetch employee details
    * def enrolledEmployees = array1.filter(emp => !array2.includes(emp))
    * print 'Employees still enrolled in the company:', enrolledEmployees.length
    * print 'Employees details enrolled in the company: ', enrolledEmployees
    * def queryEmployeeAge =
    """
    function(name) {
        return 25;
    }
    """

    * def employeeAges = []
    * karate.forEach(enrolledEmployees, (x)=>employeeAges.push({ name: x, age: queryEmployeeAge(x) }))

    * print 'Employees Ages details enrolled in the company: ', employeeAges.length
    * print 'Employees Ages details company: ', employeeAges

    * match each employeeAges[*]["age"] != 24