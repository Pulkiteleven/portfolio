'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "55a98d2f133bb742c384632fefda4f24",
".git/config": "2bdc43d739abf55b2ba974b71792ad30",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "100972c7ca9633620c9c4b0cd4a94b4a",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "4b8f8ab3824b3e7d87a9d4d62a361780",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "8675a0ccdc4a4a46bd024d64f8d99f3d",
".git/logs/refs/heads/main": "8675a0ccdc4a4a46bd024d64f8d99f3d",
".git/logs/refs/remotes/origin/main": "2dd82fd4cf630fd1b909be9e37d518fd",
".git/objects/0f/1f0ba705055d357fdf763c4bd8992611fc6441": "1ae4c89f80d7a2b1cd544e5013a76adf",
".git/objects/0f/c344c7e8b9e32ea1ad91f30ded22556352d7bf": "a8a30f28869f7378465338066f34d80d",
".git/objects/18/eb401097242a0ec205d5f8abd29a4c5e09c5a3": "4e08af90d04a082aab5eee741258a1dc",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/20/cb2f80169bf29d673844d2bb6a73bc04f3bfb8": "b807949265987310dc442dc3f9f492a2",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
".git/objects/2f/116c65e8f2b13be6ffc8d70462ad4c13d3cc74": "f94c7964938dc42893c0419538dfccec",
".git/objects/36/1330ada79fcb090bc5dad716ec390255f42144": "c6d9fcb1930879763b32905c99bc56bc",
".git/objects/3b/a119e275b752461146d5fe0f48284b6dd4bced": "ff15a9824599595c1f7eded528656a97",
".git/objects/45/9d56a9db5a913e3ec9437db6902f2dde851885": "2d70b93e5fe5971c0c8983ae8c1368ed",
".git/objects/49/adebdb511c8c293b28db3f6792e5bac28cdc32": "ba6a3971e7f06834fd6ec3844372ce17",
".git/objects/52/b38395e2d984e52d99d58e07da00a91106aa63": "6523ef68943afe03c77cc6bb3584d446",
".git/objects/57/7b5c2852b79ef2e414222f877398b3fc324bfd": "55cc0bcad55a65924252b1e9071452ed",
".git/objects/58/356635d1dc89f2ed71c73cf27d5eaf97d956cd": "f61f92e39b9805320d2895056208c1b7",
".git/objects/58/b007afeab6938f7283db26299ce2de9475d842": "6c6cbea527763bb3cdff2cecfee91721",
".git/objects/59/62efb2dffef4c259bda261b128fcab4b659c34": "11e1a7683fedc73b6a0da57ee3c6a112",
".git/objects/59/f736dd0bdcbc694f7ea3d8002de5df6f7b5ef2": "6b1859ee9190c9e46cc49f1fa106d5de",
".git/objects/62/c89ee094658c7a9465824fdb42793a64ea557b": "133cd5da638f245b079d9e9cdc29ae38",
".git/objects/6a/062fece0ae74446eda6d107dab3666678c0441": "a5297f422d8fa75aeccb91e09ab627ae",
".git/objects/71/3f932c591e8f661aa4a8e54c32c196262fd574": "66c6c54fbdf71902cb7321617d5fa33c",
".git/objects/78/c61653f4755978d8acf3aade5aff43a8a8fcef": "4bf7d34cf3a9ba2e9c96fd54429f5cb0",
".git/objects/7b/77e784f020753df5ca2e87a9e1242c4e43558b": "821adcc7533ef59ff10accc8b60e1e0a",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8b/d47cc8ccea513fed57b69208879f87a4457876": "1d57009dab4ec649f249c6ecef4cab24",
".git/objects/8f/6a562e4fb4968210a64dd6ab53d46bcb098059": "43ac79b982fbeeba65203bec8e29768c",
".git/objects/92/ca1e404d070bc2db9f64277c2a0a69a18c65ee": "34e5fb877a84304a9e0eae2dc629d2fc",
".git/objects/93/d6eaaff43211eacb03d62985a6df2e0bc3f2c9": "3211edb4b25b395769e0e146f9751a04",
".git/objects/94/f7d06e926d627b554eb130e3c3522a941d670a": "77a772baf4c39f0a3a9e45f3e4b285bb",
".git/objects/99/6deb2fef8a55f68611dbc309a0cb8071b8cd5a": "01ffb48177b0fbd89fa46fe0726537cd",
".git/objects/9e/c0745cb1d4d0f7bc9f07396614929456a6022d": "ee0dde7674d587c7335b99fd432738a1",
".git/objects/a0/fa05781783c97c9bf7ed2dcfcc9d6602ab15aa": "de5e84b57c1aefcfb70afdaedab1f1c3",
".git/objects/a5/ec3382e04a4915cdfaaa28406007565fa42a26": "ac7a2c23981c5cd79e31a89d9351cefe",
".git/objects/aa/f45f3adf119f0b5a2cd2c7d16cea2d62a0e431": "7aada5ee0e9c591e8a05319041c2cdcb",
".git/objects/ac/79f8e1468fa4dcec924d2c44b52a74325cf1ee": "8248902c3a333c06d3bde270b5285600",
".git/objects/b3/ebbd38f666d4ffa1a394c5de15582f9d7ca6c0": "23010709b2d5951ca2b3be3dd49f09df",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b7/ceabf244e6785829f169b71ad4c212f91030b4": "f3f7bd816d825ecdd5d503478979f7e9",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/bc/d8b085fd4226a518a1c20fe86d463bcdb517ab": "8c67e7c6ebbeb283496b9ae3edd054e1",
".git/objects/c0/4aa553fe8a60a83e1c547189118219f71ac443": "039634ac81f83f4a8d5cd841334ceced",
".git/objects/c1/d43f447332fe7958ec363b8d1d5459f3d4d35c": "68b2315724759c655f8eac94accbf09f",
".git/objects/c5/66b98259ae6db904e25d4e6c23d112ac06c2f3": "7bbd977fc4bcc93c61fb64eac1d6937d",
".git/objects/c9/bf8af1b92c723b589cc9afadff1013fa0a0213": "632f11e7fee6909d99ecfd9eeab30973",
".git/objects/d1/098e7588881061719e47766c43f49be0c3e38e": "f17e6af17b09b0874aa518914cfe9d8c",
".git/objects/d4/0be57a67f46728448ede398801efbeec356f56": "63e2875581364bfd53de593902eb956f",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/c0052a3e4b9113ce7b9a4ccb3f679f809354a8": "9ec3879da802241fda8bc622d1493bf9",
".git/objects/dc/977c7ac8dc6ce5b85bf62a877d51712c4c8dab": "a661c219285c66d4790b7cdc3fbc3eab",
".git/objects/df/4347eb3dff1dd69811182403d3ac0cd22cfc3f": "17e73748ae6edffdf636677c7def5fb8",
".git/objects/e5/03c4f9fba2b0813117681d116805e212f0775b": "01b2e607f44e7a9e24ed514046e349b3",
".git/objects/e6/a9008572f055df9b7217e8bd79305a47ce823d": "c5c478b350c2b02448fdf12162261609",
".git/objects/ea/58ba5eb82c6409e29398329d426131cadc3c1b": "72b3eb41310ac621d518b3b987282e6a",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f2/7bab83f4ee8e7f67eb5cf9cd408a1851164ad4": "725d47a55700fec7e6ca63627d6eab9e",
".git/objects/f3/b04ad6a613fa0ae130f80432a2ea10a0f958e9": "f9c910738e14b04ec938c017a50afadc",
".git/objects/f4/8fa9d1ed64ad5b421492adc79becb634332add": "f162e49f0e0dc1de912c5b83e315ff8b",
".git/objects/f4/c2ac9459f148719ab0a90e1975c19dfc163347": "ec60d2a7ddad40708cda4c9da628ff93",
".git/objects/fb/4345ce9a953bb21c3f979a35a282d03e7f4052": "e9a9a68c9c97c7138dac8abf8db4ae18",
".git/objects/fd/5223592ec4049a4f1b860d40e7dbbb15b44cda": "36f83e8b8714a1f3b19fdfaed55899c7",
".git/objects/fe/3914bcf3baf9d87a873a444cac8aaf9dcd54c1": "372add7dd6cdabc32b9333e8d66bff72",
".git/objects/ff/6fbbd6d128410c081cd22c64f8c5dfe41d78af": "49593d29deaff2c600b7e4cbc7b750d1",
".git/refs/heads/main": "5722a252f88b72a33ec9a0016038b521",
".git/refs/remotes/origin/main": "5722a252f88b72a33ec9a0016038b521",
"assets/AssetManifest.bin": "9a26198f5db73763230366c2421712cd",
"assets/AssetManifest.bin.json": "84e02ef36dbb3486c07887c020fefe54",
"assets/AssetManifest.json": "69ea3bc34dc80219f8584e8e26d39af7",
"assets/assets/bat.jpg": "d4275015f0c2a860a9957e7dda35b292",
"assets/assets/fonts/mons.ttf": "1973614020a8480f602fbe3bda213f8c",
"assets/assets/fonts/pop.otf": "cb612f082fd8bf1aea7c6c7df5041d2b",
"assets/assets/icons/calendar.png": "a4faa9300bb815c312ad7d0a694113dd",
"assets/assets/icons/edge.png": "f3a10583f450f68aac0eebd10d316513",
"assets/assets/icons/flutter.png": "60c68b88dc0dfa33476c605aad0b136f",
"assets/assets/icons/full_screen.png": "3efa19f82e295a7acd42ff0a54ca0fe1",
"assets/assets/icons/github.png": "eee342625fdbba45f5232fa82551d4b4",
"assets/assets/icons/leetcode.png": "5a0af7879887810f9683d279103df362",
"assets/assets/icons/linkedin.png": "c2a12e1690e3a42f2b9d816c923880aa",
"assets/assets/icons/mail.png": "bf3b48e4f4e7b8c38e9e963866af413b",
"assets/assets/icons/microsoft-store.png": "2320cf15813ca5f477f708122e58ecfa",
"assets/assets/icons/pdf.png": "b42db736c478fa96890d7196e4d7bc09",
"assets/assets/icons/seetings.png": "d732a065d05b6bfcd1244cfc25365636",
"assets/assets/icons/svg/External%2520Link.svg": "5445f0c5f36207a03764514425d8dcfc",
"assets/assets/icons/svg/GitHub.svg": "1f7ac9e7da369a9584ada87a6fda094e",
"assets/assets/icons/svg/Google%2520Play.svg": "067e7a96bf12b2432de757e20616a73c",
"assets/assets/icons/svg/youtube.svg": "c0673aa375a19b5457fb51d556f4195a",
"assets/assets/icons/windows.png": "a6bf7ca022be33eb939f6f11154c2fd7",
"assets/assets/one.jpg": "20901191d485ca3c1dc362fa75be52e6",
"assets/assets/windows.jpg": "6644e3cb118fe6d47c52a0eff0617704",
"assets/FontManifest.json": "e61344c24dc1da8e2853ed237f2602dc",
"assets/fonts/MaterialIcons-Regular.otf": "32d5bfc611fbedf9b69c20a40e43a113",
"assets/NOTICES": "d746a760302e17a504fd9efa37d244c8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "96b3b5459e4453be5fd2240eda60e7cf",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "41456be4dff75da9aeca1a9cf4f2ff55",
"/": "41456be4dff75da9aeca1a9cf4f2ff55",
"main.dart.js": "2f74381d1e596a681645a5cda1a167bb",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
