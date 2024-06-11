Feature: perform CRUD operation for bidding-campaign

Background:
    Given url apiUrl

Scenario: Get all the campaign using query params
    Given header Authorization = 'Bearer ' + create_camp_cc_read_token
    And path 'v1/campaigns'
    And params query
    When method get
    Then status 200
    * print response
    And match response.campaigns == "#string"
    And match each response.campaigns[*].company_id == 333631
    And match each response.campaigns == assertionPayload[1]
    * print assertionPayload[1]

Scenario: Create, read, and update the campaign

    # Create campaign using the random data gererator lib
    And header Authorization = 'Bearer ' + create_camp_cc_write_token
    And path 'v1/campaigns'
    And request requestpayload[0]
    * print requestpayload[0]
    When method post
    Then status 201
    And match response == { id: '#string' }
    * def campaignId = response.id
    * print 'Campaign ID:', campaignId

    # Retrieve campaign using the generated ID
    Given header Authorization = 'Bearer ' + create_camp_cc_read_token
    And path 'v1/campaigns', campaignId
    When method get
    Then status 200
    * print response
    And match response == assertionPayload[0]
    * print assertionPayload[0]


    # Patch request using the generated ID
    Given header Authorization = 'Bearer ' + create_camp_cc_write_token
    And path 'odata/v1/campaigns', campaignId
    And request requestpayload[1]
    * print requestpayload[1]
    When method patch
    Then status 200
    * print response

    # Retrieve updated campaign using the generated ID
    Given header Authorization = 'Bearer ' + create_camp_cc_read_token
    And path 'v1/campaigns', campaignId
    When method get
    Then status 200
    * print response
    