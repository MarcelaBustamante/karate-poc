#@ignore
Feature:Karate Basic todo

Background:
    * url todoBaseUrl

Scenario: Basic todo flow

    * def taskName = 'First'
    #create a todo
    Given request { "title": "#(taskName)", "complete": false }
    When method Post
    Then status 200
    And match response == { id:'#string', title: "First", complete: false }
    * def id = response.id
    * def title = response.title
    * def complete = response.complete
    * print "Value of id: " + id

    #get a single todo
    Given path id
    When method Get
    Then status 200
    And match response == { id: '#(id)', title: '#(title)', complete: '#(complete)' }

    #create a second scenario
    * def todo =
    """
        {
            title: 'Second todo',
            completed: false
        }
    """
    # Create a single todo using a variable
        Given request todo
        And header Content-Type = 'application/json'
        When method Post
        Then status 200
        And match response.title == "Second todo"

    # Get all todos
        When method Get
        Then status 200
        #check for all responses
        * match response contains { title: '#string', complete: '#boolean', id: '#string' }

    # clear api
    * call read('classpath:helpers/ResetTodos.feature')