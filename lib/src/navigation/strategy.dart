/// Defines the routing strategy for the application.
///
/// - [Web Hash](https://en.wikipedia.org/wiki/Fragment_identifier#Basics) strategy is used by default.
/// - [Web History](https://developer.mozilla.org/en-US/docs/Web/API/History_API) strategy is used when the browser supports it.
/// - [Mobile](https://developer.android.com/guide/navigation) strategy is used when the platform is mobile.
abstract class Strategy {}
