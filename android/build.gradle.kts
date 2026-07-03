allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

subprojects {
    val configureAndroid = Action<Project> {
        val android = extensions.findByName("android")
        if (android != null) {
            try {
                val getNamespace = android.javaClass.getMethod("getNamespace")
                val setNamespace = android.javaClass.getMethod("setNamespace", String::class.java)
                if (getNamespace.invoke(android) == null) {
                    val name = project.name.replace('-', '_').replace(':', '_')
                    setNamespace.invoke(android, "com.example.firstaid.$name")
                }
            } catch (e: Exception) {
                // Ignore
            }
            // Force compile SDK to 36 to satisfy AndroidX dependencies
            try {
                val compileSdkVersionMethod = android.javaClass.getMethod("compileSdkVersion", Int::class.javaPrimitiveType)
                compileSdkVersionMethod.invoke(android, 36)
            } catch (e: Exception) {
                // Ignore
            }
            try {
                val compileSdkMethod = android.javaClass.getMethod("compileSdk", Int::class.javaPrimitiveType)
                compileSdkMethod.invoke(android, 36)
            } catch (e: Exception) {
                // Ignore
            }
        }
        // Clean legacy package attribute from AndroidManifest.xml if present
        try {
            val manifestFile = file("src/main/AndroidManifest.xml")
            if (manifestFile.exists()) {
                var content = manifestFile.readText()
                if (content.contains("package=")) {
                    content = content.replace(Regex("""package\s*=\s*"[^"]*""""), "")
                    manifestFile.writeText(content)
                }
            }
        } catch (e: Exception) {
            // Ignore
        }
    }

    if (state.executed) {
        configureAndroid.execute(this)
    } else {
        afterEvaluate {
            configureAndroid.execute(this)
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
