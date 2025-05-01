##artifact build stage
FROM maven AS buildstage
RUN mkdir /opt/rajesh_vinod_project
WORKDIR /opt/rajesh_vinod_project
COPY . .
RUN mvn clean install    ## artifact -- .war

### tomcat deploy stage
FROM tomcat
WORKDIR webapps
COPY --from=buildstage /opt/rajesh_vinod_project/target/*.war .
RUN rm -rf ROOT && mv *.war ROOT.war
EXPOSE 8080
