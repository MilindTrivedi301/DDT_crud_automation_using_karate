Feature: Make a simple get request

Background: Define url
    Given url 'https://staging-service.demo.com/demo/'
    * def create_camp_cc_read_token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6IkI1QTlCOTQ2NzU3NTZEMzE3ODc2MThGNEVGMEM4MDY4IiwidHlwIjoiYXQrand0In0.eyJpc3MiOiJodHRwczovL3N0YWdpbmctYXV0aC5wZWRkbGUuY29tL2lkZW50aXR5LXByb3ZpZGVyIiwibmJmIjoxNzE3NzUxMjM2LCJpYXQiOjE3MTc3NTEyMzYsImV4cCI6MTcxNzc1ODQzNiwiYXVkIjpbIkJ1eWVyIiwiQVBJIEdhdGV3YXkiXSwic2NvcGUiOlsiYnV5OmNhbXBhaWduczpyZWFkIiwiYnV5OmNvbXBhbmllczpyZWFkIiwiYnV5Om1lc3NhZ2UtdGVtcGxhdGVzOnJlYWQiLCJidXk6bWVzc2FnZS10ZW1wbGF0ZXM6d3JpdGUiLCJidXk6b3BlcmF0aW9uLWhvdXJzOnJlYWQiLCJidXk6cHVyY2hhc2UtcG9zdHM6d3JpdGUiXSwiY2xpZW50X2lkIjoiYmI1MzFkMzEtODcxMS00MWFhLThiYjMtMGRlNmY5ODlhOTdkIiwianRpIjoiMkEwNzJEQzc5NDA0ODhBQjBEOUE5MDRFODEyQTcxM0EifQ.k-eYJvU-bsyZ1-7VRseEN76hJnOZuUYSlD14FsdmkisF6H_QpLPIzp8U8snz4V_ccyq1d5LQoGKqtMpIhDTB5UejVU-kGOrJfGfB1OASXrCHup3UXOkf0_WR8_dOUpS2gm4CKuesCR4sNCN-3ahtlNKc1MU8ei3iCejQR0Er5gDyMzOcp8PcYgTykpbhxV4CxEXrzeIkoomE3uSu6pYsHoqQIxEqXyze-cpSdQJc2vyRWDTgA9x8DMfAVBcNOqaS3ECqfqRSc0Nm9p-XfZ0IJ1xT0ocOhEa6o5hN-QACnhshcsStZYL5aCYLXNkffpC2Rb7je6EhYU3A3agyf7_Cyw'
   
Scenario: Get all the tags
    And header Authorization = 'Bearer ' + create_camp_cc_read_token
    Given path 'v1/campaigns'
    And params {sort_b:status, sort_order:asc, page_size:10, company_ids:329622, page_number:1}
    When method GET
    Then status 200
    And match response.campaigns == "#array"
    * print response