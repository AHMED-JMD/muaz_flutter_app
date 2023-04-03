// import 'dart:io';
// import 'dart:typed_data';
// import 'package:archive/archive.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// class FolderEncryptionService {
//   static const String _keyAlias = 'com.example.app.folderencryption';
//   static const String _keyStoreType = 'AndroidKeyStore';
//   static const String _cipherAlgorithm = 'AES/CBC/PKCS7Padding';
//   static const int _keySize = 256;
//   static const int _ivSize = 16;
//
//   final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
//
//   Future<File> encryptFolder(Directory folder) async {
//     // Create a ZIP archive of the folder
//     final Archive archive = Archive();
//     final List<FileSystemEntity> files = folder.listSync(recursive: true);
//     for (FileSystemEntity file in files) {
//       if (file is File) {
//         final String relativePath = file.path.substring(folder.path.length + 1);
//         final ArchiveFile archiveFile = ArchiveFile(relativePath, file.lengthSync(), file.readAsBytesSync());
//         archive.addFile(archiveFile);
//       }
//     }
//     final Uint8List zipBytes = ZipEncoder().encode(archive);
//
//     // Generate a symmetric key in the Android Keystore system
//     final KeyGenerator keyGenerator = KeyGenerator.getInstance(_keyStoreType);
//     final KeyStore keyStore = KeyStore.getInstance(_keyStoreType);
//     keyStore.load(null);
//     if (!keyStore.containsAlias(_keyAlias)) {
//       keyGenerator.init(KeyGenParameterSpec.Builder(_keyAlias, KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
//           .setBlockModes(KeyProperties.BLOCK_MODE_CBC)
//           .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_PKCS7)
//           .setKeySize(_keySize)
//           .build());
//       final SecretKey secretKey = keyGenerator.generateKey();
//     }
//     final SecretKey secretKey = keyStore.getKey(_keyAlias, null) as SecretKey;
//
//     // Encrypt the ZIP archive using the generated key
//     final Cipher cipher = Cipher.getInstance(_cipherAlgorithm);
//     cipher.init(Cipher.ENCRYPT_MODE, secretKey);
//     final Uint8List iv = cipher.getIV();
//     final Uint8List encryptedBytes = cipher.doFinal(zipBytes);
//
//     // Save the encrypted ZIP archive to internal storage
//     final Directory appDirectory = await getApplicationDocumentsDirectory();
//     final String encryptedFilePath = '${appDirectory.path}/encrypted_folder.zip';
//     final File encryptedFile = File(encryptedFilePath);
//     await encryptedFile.writeAsBytes(encryptedBytes);
//
//     // Save the IV to the secure storage
//     await _secureStorage.write(key: 'iv', value: base64Encode(iv));
//
//     return encryptedFile;
//   }
//
//   Future<Directory> decryptFolder(File encryptedFile) async {
//     // Get the IV from the secure storage
//     final String? ivString = await _secureStorage.read(key: 'iv');
//     if (ivString == null) {
//       throw Exception('IV not found');
//     }
//     final Uint8List iv = base64Decode(ivString);
//
//     // Generate the symmetric key using the key alias
//     final KeyStore keyStore = KeyStore.getInstance(_keyStoreType);
//     keyStore.load(null);
//     final SecretKey secretKey = keyStore.getKey(_keyAlias, null) as SecretKey;
//
//     // Decrypt the ZIP archive using the generated key and IV
//     final Cipher cipher = Cipher.getInstance(_cipherAlgorithm);
//     cipher.init(Cipher.DECRYPT_MODE, secretKey, IvParameterSpec(iv));
//     final Uint8List decryptedBytes = cipher.doFinal(
//         await encryptedFile.readAsBytes());
//   }