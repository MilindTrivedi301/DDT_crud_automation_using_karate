Welcome to the Karate project setup guide! Follow these steps to set up KarateDSL on your local machine.

Prerequisites
    1. Java:
        ◦ Ensure Java (version 8 or later) is installed.
        ◦ Download Java.
        ◦ Set the Java path in your system environment variables.
    2. Maven:
        ◦ Install Maven to manage project dependencies.
        ◦ Download Maven.
        ◦ Set the Maven path in your system environment variables.
    3. IDE:
        ◦ Use an IDE like Eclipse, IntelliJ IDEA, or Visual Studio Code.
        ◦ Ensure the IDE is configured with Java and Maven.

Steps to Create a New Maven Project
    1. Open your IDE (Eclipse, IntelliJ IDEA, or Visual Studio Code).
    2. Open terminal/command prompt in your IDE or externally.
    3. Navigate to your desired directory:
          cd /path/to/your/directory
    4. Generate a new Karate project:
          mvn archetype:generate -DarchetypeGroupId=com.intuit.karate -DarchetypeArtifactId=karate-archetype -DarchetypeVersion=1.0.1 -DgroupId=com.mycompany -DartifactId=ProjectName
            ◦ Replace com.mycompany with your package name.
            ◦ Replace ProjectName with your project name.

Project Structure
    • pom.xml: Contains project configuration and dependencies.
    • *.feature files: Define test scenarios using BDD syntax.
    • karate-config.js: Configuration file for global variables and settings.
    • ExamplesTest.java: Sample JUnit test class for running feature files.

Running Feature Files
    • Using Maven:
        ◦ mvn test
    • Using IDE:
        ◦ Right-click a feature file and select "Run As" > "Karate Test" (or similar option).

For more details, refer to the official Karate documentation : https://github.com/karatelabs/karate?tab=readme-ov-file#.

Happy testing!
