module.exports = ({ env }) => ({
  defaultConnection: 'default',
  connections: {
    default: {
      connector: 'bookshelf',
      settings: {
        client: 'postgres',
        host: env('DATABASE_HOST', 'didosvrdb.postgres.database.azure.com'),
        port: env.int('DATABASE_PORT', 5432),
        database: env('DATABASE_NAME', 'strapidata'),
        username: env('DATABASE_USERNAME', 'jat@didosvrdb'),
        password: env('DATABASE_PASSWORD', '@Ja11est'),
        ssl: env.bool('DATABASE_SSL', true),
      },
      options: {}
    },
  },
});
