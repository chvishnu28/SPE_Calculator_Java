FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy the correct JAR file from target/ directory
COPY target/scientific-calculator-1.0-SNAPSHOT.jar /app/scientific-calculator.jar

# Keep container running using an infinite loop
CMD ["sh", "-c", "java -jar /app/scientific-calculator.jar && tail -f /dev/null"]
