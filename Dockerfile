FROM maven:3.9.6-amazoncorretto-21 as build

WORKDIR /app

ADD jsprit-core/*.xml .

RUN mvn verify clean

ADD jsprit-core .

# Package the code into a JAR.
RUN mvn package -Dmaven.test.skip

RUN mv target/*shaded.jar jsprit-core.jar
