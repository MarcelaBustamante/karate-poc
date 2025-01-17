Feature:

Background:
    * url todoBaseUrl
    * def sleep = function(pause){ java.lang.Thread.sleep(pause * 1000) }
Scenario Outline:
    * request { title: '#(title)', complete: '#(complete)' }
    * method Post
    * status 200
    * print "Finished iteration:" + iteration
    * sleep(5)

    Examples:
    | title | iteration |
    |One    | 1         |   
    |Two    | 2         |
    |Three  | 3         |