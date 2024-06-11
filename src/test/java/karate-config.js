function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'qa';
  }
  
  if (env == 'dev') {
    var config = {
      apiUrl: 'https://staging-service.demo.com/demo/'
    }
    // config.userEmail = 'test.user@gmail.com'
    // config.userPassword = 'Mtech123'
  }
  if (env == 'qa') {
    var config = {
      apiUrl: 'https://staging-service.demo.com/demo/'
    }
    // config.userEmail = 'karate7568@test.com'
    // config.userPassword = 'Mtech123'
  }

  var config = {
    env: env,
    myVarName: 'helloKarate',
    
    apiUrl: 'https://staging-service.demo.com/demo/',
    
    create_camp_cc_read_token: 'eyJhbGciOiJSUzI1NiIsImtpZCI6IkI1QTlCOTQ2NzU3NTZEMzE3ODc2MThGNEVGMEM4MDY4IiwidHlwIjoiYXQrand0In0.eyJpc3MiOiJodHRwczovL3N0YWdpbmctYXV0aC5wZWRkbGUuY29tL2lkZW50aXR5LXByb3ZpZGVyIiwibmJmIjoxNzE3NzU4ODQzLCJpYXQiOjE3MTc3NTg4NDMsImV4cCI6MTcxNzc2NjA0MywiYXVkIjpbIkJ1eWVyIiwiQVBJIEdhdGV3YXkiXSwic2NvcGUiOlsiYnV5OmNhbXBhaWduczpyZWFkIiwiYnV5OmNvbXBhbmllczpyZWFkIiwiYnV5Om1lc3NhZ2UtdGVtcGxhdGVzOnJlYWQiLCJidXk6bWVzc2FnZS10ZW1wbGF0ZXM6d3JpdGUiLCJidXk6b3BlcmF0aW9uLWhvdXJzOnJlYWQiLCJidXk6cHVyY2hhc2UtcG9zdHM6d3JpdGUiXSwiY2xpZW50X2lkIjoiYmI1MzFkMzEtODcxMS00MWFhLThiYjMtMGRlNmY5ODlhOTdkIiwianRpIjoiQ0MxMEU3MDJDMkIxNjNFMjdBOUJFNDFBRTAwM0ZFMUYifQ.sYmSkA4nCQF-1mXCCWsoO3PK74A90Z4iGZyXMl88qYm13U865mn4c24G1yBQdTzAoFuw4ftgO0RTzqJRxS8msrTMAwkhO57dV8OFuNDU44BMvCYBZ4i_LsgrhAYVYs6yAVKfbX1jMxE6lFVxj-t3eoNyI9UWYUS-pM47bQT1NPs6aSyR7TaQM8FHG6d6NgXU7EWQru1s_Sy_tD8Mgqfmehbujb4jKTvfGFq5LeVf91cl-d9t-hikdvjzNLQzmuHs99ks4XJbnz71hAE6a2GzbH6kpWY7ENxnKBUe4klsEs3gAEMkA8k_VXmiwe9p3uH3asM3ERp3wAEDaHXTEBgfdA',
    create_camp_cc_write_token: 'eyJhbGciOiJSUzI1NiIsImtpZCI6IkI1QTlCOTQ2NzU3NTZEMzE3ODc2MThGNEVGMEM4MDY4IiwidHlwIjoiYXQrand0In0.eyJpc3MiOiJodHRwczovL3N0YWdpbmctYXV0aC5wZWRkbGUuY29tL2lkZW50aXR5LXByb3ZpZGVyIiwibmJmIjoxNzE3NzU4ODY2LCJpYXQiOjE3MTc3NTg4NjYsImV4cCI6MTcxNzc2NjA2NiwiYXVkIjpbIkJ1eWVyIiwiQVBJIEdhdGV3YXkiXSwic2NvcGUiOlsiYnV5OmNhbXBhaWduczp3cml0ZSJdLCJjbGllbnRfaWQiOiJiYjUzMWQzMS04NzExLTQxYWEtOGJiMy0wZGU2Zjk4OWE5N2QiLCJqdGkiOiIyNzVEQkEwMTE5NkRFN0E3MEZDQjEzNjk3QzEzRjM3OSJ9.Es5GGfJ4_7rAxIzc1yRcR6hcUVl4-7OCAdm1CkOzJuPE79DvqgYF_3Z5xOobU6g_VD2O4etWY9yh4z00GHmLvpEAiZuCMmoxonRBIksTl1J0EfaP3ZnM3vlXuPuFArclkF3smtchlNZlvF2D8x0uh67SrP1GNoq1J4bcCgWRIKSJXYZ_vjmOOdtHTcQ4o6z91DWUXczZsFFvmKEExxyFS9XJ-nFxOqOo1X8wZ29hytlC9dWFgrryFiDuwl3hmvX8aCBWFl_It0Cm4euK9GUSWtgztvxfuXY187XrtuKszsroK0UJj0zTZ8o0hxoZELPqNCKt27kP6KYoaeiajkzmnw',
    
    query: {sort_b: 'status', sort_order: 'asc', page_size: 10, company_ids: 333631, page_number: 1},
    
    timeValidator: karate.read('classpath:helpers/timeValidator.js'),
    
    dataGenerator: Java.type('helpers.dataGenerator'),
    
    requestpayload: karate.read('classpath:helpers/postPayload.json'),
    assertionPayload: karate.read('classpath:helpers/assertionPayload.json')
  }

// Background Steps: Function to update payload with random data
  function updatePayloadWithRandomData(requestpayload) {
  var random_camp_name = config.dataGenerator.getRandomCampaignName();
  var description = "This campaign covers " + random_camp_name + " state";
  
  for (var i = 0; i < requestpayload.length; i++) {
    if (requestpayload[i].name == undefined) {
      requestpayload[i].name = random_camp_name;
    }
    if (requestpayload[i].description == undefined) {
      requestpayload[i].description = description;
    }
  }
}

// Update requestpayload with random data
updatePayloadWithRandomData(config.requestpayload);

  
  return config;
}


