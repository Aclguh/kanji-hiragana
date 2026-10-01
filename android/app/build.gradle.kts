import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// 读取签名配置。key.properties 不入库(见 android/.gitignore),
// 因此 clone 下来没配密钥时自动回落到 debug 签名, 保证仍可构建。
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
val hasReleaseKeystore = keystorePropertiesFile.exists()
if (hasReleaseKeystore) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.kanjihiragana.kanji_hiragana"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.kanjihiragana.kanji_hiragana"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        // 词典数据量大, 关闭无用 ABI 下的资源压缩以避免体积膨胀。
        // 同时显式声明为日语学习工具类应用。
        resourceConfigurations += listOf("zh", "ja", "en")
    }

    signingConfigs {
        if (hasReleaseKeystore) {
            create("release") {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = rootProject.file(keystoreProperties["storeFile"] as String)
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }

    buildTypes {
        release {
            // 有 key.properties 时用正式密钥签名, 否则回落到 debug 签名。
            signingConfig = if (hasReleaseKeystore) {
                signingConfigs.getByName("release")
            } else {
                if (project.hasProperty("requireReleaseKey") &&
                    project.property("requireReleaseKey") == "true"
                ) {
                    throw GradleException(
                        "requireReleaseKey=true 但未找到 key.properties: " +
                            "release 包将使用 debug 签名, 无法覆盖升级正式版本, 已拒绝构建。"
                    )
                }
                // 回落保留给开源 clone 的构建便利, 但必须足够醒目,
                // 避免「发了 debug 签名的包」这种事后才能发现的事故。
                logger.error(
                    "未找到 key.properties, release 构建回落到 DEBUG 签名, " +
                        "该安装包无法覆盖升级正式版本; " +
                        "发版请配置签名或使用 -PrequireReleaseKey=true 强制校验。"
                )
                signingConfigs.getByName("debug")
            }
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
