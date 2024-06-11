Feature: perform CRUDi operation for demo-campaign using DDT

Background:
    Given url apiUrl

Scenario Outline: Verify and create negative scenarios using data generator lib

    And header Authorization = 'Bearer ' + create_camp_cc_write_token
    And path 'v1/campaigns'
    And request <requestpayload>
    When method post
    Then status <status>
    And match response == <Response> 
    * print response

    Examples: 

        |  requestpayload                   |       Response                                                                                                                | status    |
        |  requestpayload[0]                |       {id: '#string'}                                                                                                         | 201       |
        |  requestpayload[2]                |       {"code": "name_already_exists","message": "Campaign name already exists"}                                               | 400       |
        |  requestpayload[3]                |       {"code":"invalid_request_parameters","message":"One or more parameters invalid"}                                        | 400       |
        |  requestpayload[4]                |       {"code":"invalid_name","message":"Campaign name invalid"}                                                               | 400       |
        |  requestpayload[5]                |       {"code":"name_exceeds_max_length","message":"Campaign name cannot exceed 255 characters"}                               | 400       |
        |  requestpayload[6]                |       {"code":"invalid_description","message":"Campaign description invalid"}                                                 | 400       |
        |  requestpayload[7]                |       {"code":"description_exceeds_max_length","message":"Campaign description cannot exceed 500 characters"}                 | 400       |
        |  requestpayload[8]                |       {"code":"invalid_status","message":"Campaign status invalid"}                                                           | 400       |
        |  requestpayload[9]                |       {"code":"invalid_zip_codes","message":"Campaign ZIP codes invalid","data":{"zip_codes":["11111"]}}                      | 400       |
        |  requestpayload[10]               |       {"code":"invalid_company_id","message":"Company ID invalid"}                                                            | 400       |


Scenario Outline: Verify tc using csv or database file(external files)

    And header Authorization = 'Bearer ' + create_camp_cc_write_token
    And path 'v1/campaigns'
    And request { "name": <name>, "zip_codes":<zip_codes>, "company_id":<company_id> }
    When method post
    Then status 400
    * print response
    
    Examples: 

        |   read('classpath:helpers/json_to_csv.csv')  |
