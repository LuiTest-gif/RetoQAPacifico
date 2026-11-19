function fn() {
  var env = karate.env || 'qa';
  var config = {
    env: env,
    baseUrl: 'https://serverest.dev'
  };

  if (env === 'local') {
    config.baseUrl = 'http://localhost:3000';
  }

  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 15000);
  karate.configure('ssl', true);
  return config;
}
