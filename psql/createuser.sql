DO
$do$
BEGIN
   IF EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname = 'fluent') THEN

      RAISE NOTICE 'Role "fluent" already exists. Skipping.';
   ELSE
      BEGIN  
         CREATE ROLE fluent LOGIN PASSWORD 'admin';
      EXCEPTION
         WHEN duplicate_object THEN
            RAISE NOTICE 'Role "fluent" was just created by a concurrent transaction. Skipping.';
      END;
   END IF;
END
$do$;