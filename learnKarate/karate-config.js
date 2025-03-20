function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env
  }
  karate.log('karate.env system property was:', env);
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    config.baseURL = 'https://www.google.com/'
  } else if (env == 'e2e') {
    // customize
  }
  karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    return config;
  return config;
}