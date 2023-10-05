# Use an official OpenJDK image as a parent image
FROM openjdk:11-jre-slim 

# Set the working directory in the container
WORKDIR /app

# Copy the project's source code to the container
COPY . .

# Compile your Java code to create the JAR file
RUN javac -cp . YourMainClass.java

# Create a JAR file from the compiled classes
RUN jar cf YourApp.jar YourMainClass.class

# Define the command to run your application
CMD ["java", "-jar", "YourApp.jar"]
