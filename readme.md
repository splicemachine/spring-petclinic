# Splice Machine Spring PetClinic Sample Application 

###### A fork of [spring-projects/spring-petclinic][4]

## Overview
PetClinic is a Spring application designed to demonstrate the framework's ability to interact with a database. Our fork includes our hibernate dialect and JDBC driver in an effort to demonstrate drop-in communication with Splice Machine as the datastore.

In this fork we have made modifications to utilize:
```
com.splicemachine.db.jdbc.ClientDriver
com.splicemachine.hibernate.SpliceMachineDialect
```

## Build and Run
### Spring Local
You can use the original Spring development server to test the application locally:
```bash
./mvnw spring-boot:run
```

### Container Local
To test the container locally you will want to pass the Splice Machine database connection string via the environment:
```
mvn install -DskipTests
docker build .
[image hash]
docker run -p 8080:8080 --name petclinic -e"DATABASE_HOST=jdbc:splice://docker.for.mac.localhost:1527/splicedb;user=splice;password=admin" [image hash]
```
>**Note**: The Docker Apple DNS convention `docker.for.mac.localhost` is used to facilitate communication with the host machine. Local containers will need to access the host machine's copy of Splice Machine.

### Container Cloud Push
```
mvn install -DskipTests
docker build .
[image hash]
docker tag [image hash] splicemachine/petclinic
docker push splicemachine/petclinic
```
**Note**: Test skipping is necessary at this point because not all database interactions are implemented.

### Run Marathon Application
- Go to desired Marathon environment
- Select "Create Application"
- Use contents of `marathon.json` to create application
- **Note**: You will want to modify `$DATABASE_HOST` in the marathon application environment to reflect the location of your database.

## Inherited Readme
Please see the [documentation][2] for the original repo.

<!-- ## Miscellaneous
- [Eclipse Configuration][5] -->

[1]: https://splicemachine.atlassian.net/wiki/spaces/~nnygaard/pages/115507299/Configure+Build+Environment
[2]:https://github.com/spring-projects/spring-petclinic
[3]: https://www.splicemachine.com/tutorial/connecting-programmatically/
[4]: https://github.com/spring-projects/spring-petclinic
[5]: docs/eclipse-configuration.md
