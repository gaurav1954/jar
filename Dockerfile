# Use an official OpenJDK image as a parent image
FROM openjdk:17

# Set the working directory in the container
WORKDIR /app

# Copy the project's source code to the container
COPY . .

# Compile your Java code to create the JAR file
RUN javac -cp . abc.java

# Create a JAR file from the compiled classes
RUN jar cf abc.jar abc.class

# Define the command to run your application
CMD ["java", "-jar", "abc.jar"]
