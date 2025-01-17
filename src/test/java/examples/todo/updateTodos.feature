Feature: Second feature file for todos

Background:
    * url todoBaseUrl

@smoke    
Scenario: Update a todo
    * def taskName = 'MyFirstTask'
        #create a todo
        Given request { "title": "#(taskName)", "complete": false }
        When method Post
        Then status 200
        And match response == { id:'#string', title: '#(taskName)', complete: false }
        * def id = response.id
        * def title = response.title
        * def complete = response.complete
        * print "Value of id: " + id
        
        # Update a single todo
        Given path id
        And request { complete: true }
        When method Put
        Then status 200
        And match response.complete == true

        # Delete a single todo
        Given path id
        When method Delete
        Then status 200