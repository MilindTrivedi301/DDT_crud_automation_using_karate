@ignore
Feature:Make a get request with assertion and fuzzy matching

Background: Define url
    Given url 'https://staging-service.demo.com/buyer/'

Scenario: Get all the tags
    And header Authorization = 'Bearer ' + karate.get('Rtoken')
    Given path 'v1/campaigns'
    And params {sort_b:status, sort_order:asc, page_size:10, company_ids:333631, page_number:1}
    When method GET
    Then status 200
    * print response

    And match response.campaigns == "#array"
    And match each response.campaigns[*].company_id == 333631
    And match response.campaigns[3].name !contains 'truck'
    
    And match each response.campaigns ==
      """ 
        {
      "id": "#string",
      "company_id": "#number",
      "name": "#string",
      "description": "#string",
      "status": "#string",
      "statistics": {
        "total_offers_assigned": "#number",
        "total_offers_qualified": "#number",
        "win_rate": "#number"
      },
      "last_modified_at": "#? timeValidator(_)",
      "last_modified_by": "#number",
      "last_modified_by_user_type": "#number",
      "carrier_type": {
        "code": "#string",
        "description": "#string"
      },
      "missing_titles_supported": "#boolean"
    }
      """
