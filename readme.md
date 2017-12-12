# Splice Machine Spring PetClinic Sample Application 

###### A fork of [spring-projects/spring-petclinic][4]


## Splice Machine Configuration

In this fork we have made modifications to utilize:
```
com.splicemachine.db.jdbc.ClientDriver
com.splicemachine.hibernate.SpliceMachineDialect
```
Our driver speaks JDBC and this is an effort to demonstrate that an established application can drop in Splice Machine and hit the groud running.

### Build Environment
Updated Build Environment Configuration Documentation [specific to SpliceMachine][1] new developers.

### `localhost` database configuration
In its default configuration, Petclinic uses an in-memory database (HSQLDB) which
gets populated at startup with data. 

You could start a Splice Machine database running locally by editing application.properties:

```
database=splicemachine
spring.datasource.schema=classpath*:db/${database}/schema.sql
spring.datasource.data=classpath*:db/${database}/data.sql

spring.datasource.url=jdbc:splice://localhost:1527/splicedb;user=splice;password=admin
spring.datasource.username=splice
spring.datasource.password=admin
spring.datasource.driver-class-name=com.splicemachine.db.jdbc.ClientDriver
spring.jpa.database-platform=com.splicemachine.SpliceMachineDialect
```
See our [tutorials][3] to connect to our ODBC driver to allow Splice Machine to connect any other database or business tools that needs access to your database

### Build and Push to Cloud
```
mvn install -DskipTests
docker build .
[image output]
docker tag [image output] splicemachine/petclinic
docker push splicemachine/petclinic
```
**Note**: Test skipping is necessary at this point because not all database interactions are implemented.

### Run Marathon Application
- Go to desired Marathon environment
- Select "Create Application"
- Use contents of `marathon.json` to create application
- **Note**: The `marathon.json` contains environment variables that are necessary to run the application's docker container locally, should you choose to test locally.

## Inherited Readme
Please see the [documentation][2] for the original repo.

## Miscellaneous
- [Eclipse Configuration][5]

[1]: https://splicemachine.atlassian.net/wiki/spaces/~nnygaard/pages/115507299/Configure+Build+Environment
[2]:https://github.com/spring-projects/spring-petclinic
[3]: https://www.splicemachine.com/tutorial/connecting-programmatically/
[4]: https://github.com/spring-projects/spring-petclinic
[5]: docs/eclipse-configuration.md
