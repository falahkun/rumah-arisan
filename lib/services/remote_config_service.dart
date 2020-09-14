part of 'services.dart';

class RemoteConfigService {
  static Future<Map<String, dynamic>> getHeaders() async {
    try {
      RemoteConfig _remoteConfig = await RemoteConfig.instance;
      await _remoteConfig.setDefaults({'welcome': 'default welcome'});
      await _remoteConfig.fetch(expiration: const Duration(hours: 5));
      await _remoteConfig.activateFetched();
      String csrfId = _remoteConfig.getString("csrf_id");
      String csrfToken = _remoteConfig.getString("csrf_token");

      // print(csrfToken + csrfId);

      return {'csrf-id': csrfId ?? '', 'csrf-token': csrfToken ?? ''};
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<String> getAppVersion() async {
    try {
      RemoteConfig _remoteConfig = await RemoteConfig.instance;
      await _remoteConfig.setDefaults({'welcome': 'default welcome'});
      await _remoteConfig.fetch(expiration: const Duration(hours: 1));
      await _remoteConfig.activateFetched();
      String appVersion = _remoteConfig.getString("app_version");
      return appVersion;
    } catch (e) {
      return null;
    }
  }

  static Future<String> getBaseUrl() async {
    try {
      RemoteConfig _remoteConfig = await RemoteConfig.instance;
      await _remoteConfig.setDefaults({'welcome': 'default welcome'});
      await _remoteConfig.fetch(expiration: const Duration(hours: 5));
      await _remoteConfig.activateFetched();
      String baseUrl = _remoteConfig.getString("base_url");
      return baseUrl;
    } catch (e) {
      return null;
    }
  }
}
